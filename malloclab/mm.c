/*
 * mm.c
 *
 * Name:	Guo Tiankui
 * userID:	1300012790@pku.edu.cn
 * 
 * Description:
 *
 * The strategy is best fit.
 * Use splay tree and lists to maintain the free blocks.
 *
 * Block addresses start at (8x - 4)
 *
 * ||	-> 8x (ALIGNED)
 * |	-> 8x - 4
 *
 * Free block size >= 88 (in splay tree):
 * |   4   ||   4   |   4   ||   4   |  ...  ||   4   |
 * | left  || right | next  || size  |  ...  || size  |
 * left / right / next = 1 <=> NULL
 *
 * Free block size >= 16 (list header)
 * |   4   ||   4   |   4   ||   4   |  ...  ||   4   |
 * |   0   ||  ---  | next  || size  |  ...  || size  |
 * next = 1 <=> NULL
 *
 * Free block size >= 16 (in list):
 * |   4   ||   4   |   4   ||   4   |  ...  ||   4   |
 * |   2   || prev  | next  || size  |  ...  || size  |
 * next = 1 <=> NULL
 *
 * Free block size = 8 (cannot be used, until it's coalesced):
 * |   4   ||   4   |
 * |   3   ||   8   |
 *
 * Allocated block (size >= 16):
 * |   4   ||  ...  |  ...  ||   4   |
 * | size  ||  ...  |  ...  ||  ...  |
 * The last three bits of size store some extra information:
 * 100: the previous block is allocated.
 * 101: the previous block is free block.
 *
 */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "mm.h"
#include "memlib.h"

/* If you want debugging output, use the following macro.  When you hand
 * in, remove the #define DEBUG line. */
//#define DEBUG
#ifdef DEBUG
# define dbg_printf(...) printf(__VA_ARGS__)
#else
# define dbg_printf(...)
#endif


/* do not change the following! */
#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#endif /* def DRIVER */

/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(p) (((size_t)(p) + (ALIGNMENT-1)) & ~0x7)

#define TAG_ALLOC(ptr, size) (((int *)(ptr))[0] = (size) ^ 4)
#define TAG_PREV_ALLOC_PTR(ptr) (((int *)(ptr))[0] &= ~1)
#define TAG_PREV_FREE_PTR(ptr) (((int *)(ptr))[0] |= 1)
#define TAG_PREV_ALLOC(ptr) \
	TAG_PREV_ALLOC_PTR((ptr) == mem_heap_hi() + 1 ? &hi_tag : (ptr))
#define TAG_PREV_FREE(ptr) \
	TAG_PREV_FREE_PTR((ptr) == mem_heap_hi() + 1 ? &hi_tag : (ptr))

#define TAG_FREE_8(ptr) (((long *)(ptr))[0] = 8LL << 32 | 3)
#define TAG_FREE(ptr, size) (((int *)(ptr))[3] = \
		((int *)((ptr) + (size)))[-1] = (size))
#define TAG_FREE_LIST(ptr) (((int *)(ptr))[0] = 2)

#define ALLOC_TAG(ptr) (((int *)(ptr))[0] & 4)
#define ALLOC_SIZE(ptr) (((int *)(ptr))[0] & ~7)

#define FREE_TYPE(ptr) (((int *)(ptr))[0] & 3)
#define FREE_SIZE(ptr) ((int *)(ptr))[3]
#define FREE_NEXT(ptr) ((int *)(ptr))[2]

#define FREE_CHILD(ptr, child) ((int *)(ptr))[child]
#define FREE_CHILDREN(ptr) ((long *)(ptr))[0]

#define FREE_PREV(ptr) ((int *)(ptr))[1]

#define PREV_FREE_TAG(ptr) (((int *)(ptr))[0] & 1)
#define PREV_FREE_SIZE(ptr) (((int *)(ptr))[-1])

#define THRESHOLD 9
#define BLOCKSIZE 80

static int in_heap(const void *p);

static void *heapstart;
static int *linkstart;

static int splay_root;
static int hi_tag;

/*
 * Initialize: return -1 on error, 0 on success.
 */
int mm_init(void) {
	linkstart = mem_sbrk(THRESHOLD * 4);
	int i;
	for (i = 0; i < THRESHOLD; i++)
		linkstart[i] = 1;
	heapstart = mem_heap_hi() + 1;
	splay_root = 1;
	hi_tag = 0;
	return 0;
}

int splay_rotate(int node, int child) {
	int child_node = FREE_CHILD(heapstart + node, child);
	FREE_CHILD(heapstart + node, child) =
		FREE_CHILD(heapstart + child_node, !child);
	FREE_CHILD(heapstart + child_node, !child) = node;
	return child_node;
}

int splay_insert(int node, void *ptr) {
	// Insert a big free block to the splay tree or the attached lists
	if (node == 1) {
		FREE_CHILDREN(ptr) = 1LL << 32 | 1LL;
		FREE_NEXT(ptr) = 1;
		return ptr - heapstart;
	}
	void *node_ptr = heapstart + node;
	if (FREE_SIZE(node_ptr) == FREE_SIZE(ptr)) {
		FREE_CHILDREN(ptr) = FREE_CHILDREN(node_ptr);
		FREE_NEXT(ptr) = node;
		TAG_FREE_LIST(node_ptr);
		FREE_PREV(node_ptr) = ptr - heapstart;
		return ptr - heapstart;
	}
	int child = FREE_SIZE(node_ptr) < FREE_SIZE(ptr);
	FREE_CHILD(node_ptr, child) =
		splay_insert(FREE_CHILD(node_ptr, child), ptr);
	return node;//splay_rotate(node, child);
}

int splay_search(int node, int size) {
	// Look for a best fit free block in the splay tree
	if (node == 1)
		return 1;
	void *node_ptr = heapstart + node;
	int child = FREE_SIZE(node_ptr) < size;
	if (FREE_SIZE(node_ptr) == size)
		return node;
	if ((FREE_CHILD(node_ptr, child) =
				splay_search(FREE_CHILD(node_ptr, child), size)) != 1)
		return size != ~0U >> 1 &&
			FREE_SIZE(heapstart + FREE_CHILD(node_ptr, child)) < size ?
			node : splay_rotate(node, child);
	else
		return node;
}

void splay_remove() {
	// Remove the splay tree's root
	int right_child = FREE_CHILD(heapstart + splay_root, 1);
	splay_root = FREE_CHILD(heapstart + splay_root, 0);
	if (splay_root == 1)
		splay_root = right_child;
	else {
		splay_root = splay_search(splay_root, ~0U >> 1);
		FREE_CHILD(heapstart + splay_root, 1) = right_child;
	}
}

void *free_search(int size) {
	// Look for a best fit free block in the lists or the splay tree
	int i;
	if (size < 16)
		size = 16;
	for (i = (size >> 3) - 2; i < THRESHOLD; i++)
		if (linkstart[i] != 1)
			return heapstart + linkstart[i];
	splay_root = splay_search(splay_root, size);
	return splay_root == 1 ||
		FREE_SIZE(heapstart + splay_root) < size ?
		NULL : heapstart + splay_root;
}

void free_remove(void *ptr) {
	// Remove the free block specified by ptr
	int next_node;
	if (FREE_TYPE(ptr) == 2) {
		if ((FREE_NEXT(heapstart + FREE_PREV(ptr)) =
					next_node = FREE_NEXT(ptr)) != 1)
			FREE_PREV(heapstart + next_node) = FREE_PREV(ptr);
	} else if (FREE_SIZE(ptr) <= (THRESHOLD + 1) << 3) {
		if ((linkstart[(FREE_SIZE(ptr) - 16) >> 3] =
					next_node = FREE_NEXT(ptr)) != 1)
			FREE_CHILD(heapstart + next_node, 0) = 0;
	} else {
		free_search(FREE_SIZE(ptr));
		next_node = FREE_NEXT(ptr);
		if (next_node != 1) {
			FREE_CHILDREN(heapstart + next_node) = FREE_CHILDREN(ptr);
			splay_root = next_node;
		} else
			splay_remove();
	}
}

void free_insert(void *ptr) {
	// Insert a big free block specified by ptr into the splay tree
	splay_root = splay_insert(splay_root, ptr);
}

void free_add(void *ptr, int size) {
	// Insert a free block specified by ptr into the lists or the splay tree
	int *link;
	if (size > (THRESHOLD + 1) << 3) {
		TAG_FREE(ptr, size);
		free_insert(ptr);
		TAG_PREV_FREE(ptr + size);
	} else if (size >= 16) {
		TAG_FREE(ptr, size);
		link = linkstart + ((size - 16) >> 3);
		if (*link != 1) {
			TAG_FREE_LIST(heapstart + *link);
			FREE_PREV(heapstart + *link) = ptr - heapstart;
		}
		FREE_CHILD(ptr, 0) = 0;
		FREE_NEXT(ptr) = *link;
		*link = ptr - heapstart;
		TAG_PREV_FREE(ptr + size);
	} else if (size) {
		TAG_FREE_8(ptr);
		TAG_PREV_FREE(ptr + size);
	} else
		TAG_PREV_ALLOC(ptr + size);
}

void extend_heap(int size) {
	// Extend the heap by at least size bytes
	if (size < BLOCKSIZE) {
		size = BLOCKSIZE - size;
		mem_sbrk(BLOCKSIZE);
		free_add(mem_heap_hi() + 1 - size, size);
	} else
		mem_sbrk(size);
}

/*
 * malloc
 */
void *malloc(size_t size) {
	if (size == 0)
		return NULL;
	size = ALIGN(size + 4);
	void *ptr;
	int rest_size;
	if ((ptr = free_search((int)size))) {
		// Hit!
		free_remove(ptr);
		rest_size = FREE_SIZE(ptr) - size;
		free_add(ptr + size, rest_size);
		TAG_ALLOC(ptr, size);
	} else {
		ptr = mem_heap_hi() + 1;
		if (hi_tag) {
			// Find a free block at the end of the heap
			rest_size = PREV_FREE_SIZE(ptr);
			ptr -= rest_size;
			if (rest_size != 8)
				free_remove(ptr);
			hi_tag = 0;
			extend_heap(size - rest_size);
		} else
			extend_heap(size);
		TAG_ALLOC(ptr, size);
	}
	return ptr + 4;
}

void free_next(void *ptr, int size) {
	// Check if the next block is free, and coalesce them if so
	void *next_ptr = ptr + size;
	if (ptr + size <= mem_heap_hi() && !ALLOC_TAG(next_ptr)) {
		if (FREE_TYPE(next_ptr) == 3)
			size += 8;
		else {
			free_remove(next_ptr);
			size += FREE_SIZE(next_ptr);
		}
	}
	free_add(ptr, size);
}

/*
 * free
 */
void free(void *ptr) {
	if (!in_heap(ptr)) return;
	ptr -= 4;
	int size = ALLOC_SIZE(ptr);
	int prev_size;
	if (PREV_FREE_TAG(ptr)) {
		// Check if the previous block is free
		// Coalesce them if so
		prev_size = PREV_FREE_SIZE(ptr);
		size += prev_size;
		ptr -= prev_size;
		if (prev_size != 8)
			free_remove(ptr);
	}
	free_next(ptr, size);
}

/*
 * realloc - you may want to look at mm-naive.c
 */
void *realloc(void *oldptr, size_t size) {
	if (!oldptr)
		return malloc(size);
	if (size == 0) {
		free(oldptr);
		return NULL;
	}
	void *ptr;
	int old_size = ALLOC_SIZE(oldptr - 4) - 4;
	ptr = malloc(size);
	if (old_size > (int)size)
		old_size = size;
	memcpy(ptr, oldptr, old_size);
	free(oldptr);
	return ptr;
	/*
	 * In this lab we have no need to do any optimization for realloc,
	 * but you may like to have a look.
	 */
	/*
		if (!oldptr)
			return malloc(size);
		if (size == 0) {
			free(oldptr);
			return NULL;
		}
		oldptr -= 4;
		void *ptr;
		int old_size = ALLOC_SIZE(oldptr);
		int tag = PREV_FREE_TAG(oldptr);
		if (size < 8)
			size = 8;
		size = ALIGN(size + 4);
		if ((int)size == old_size)
			return oldptr + 4;
		else if ((int)size < old_size) {
			// Shrink the given block
			TAG_ALLOC(oldptr, size);
			if (tag)
				TAG_PREV_FREE(oldptr);
			free_next(oldptr + size, old_size - size);
			return oldptr + 4;
		} else if (oldptr + old_size == mem_heap_hi() + 1) {
			// The given block is at the end of the heap
			extend_heap(size - old_size);
			TAG_ALLOC(oldptr, size);
			if (tag)
				TAG_PREV_FREE(oldptr);
			return oldptr + 4;
		} else if (!ALLOC_TAG(oldptr + old_size) &&
				(FREE_TYPE(oldptr + old_size) == 3 ?
				 8 : FREE_SIZE(oldptr + old_size)) + old_size >= (int)size){
			// The next block is a free block and big enough
			if (FREE_TYPE(oldptr + old_size) == 3)
				old_size += 8;
			else {
				free_remove(oldptr + old_size);
				old_size += FREE_SIZE(oldptr + old_size);
			}
			TAG_ALLOC(oldptr, size);
			if (tag)
				TAG_PREV_FREE(oldptr);
			free_add(oldptr + size, old_size - size);
			return oldptr + 4;
		} else {
			ptr = malloc(size - 4);
			memcpy(ptr, oldptr + 4, old_size - 4);
			free(oldptr + 4);
			return ptr;
		}
	*/
}

/*
 * calloc - you may want to look at mm-naive.c
 * This function is not tested by mdriver, but it is
 * needed to run the traces.
 */
void *calloc(size_t nmemb, size_t size) {
	void *ptr = malloc(nmemb * size);
	memset(ptr, 0, nmemb * size);
	return ptr;
}


/*
 * Return whether the pointer is in the heap.
 * May be useful for debugging.
 */
static int in_heap(const void *p) {
	return p <= mem_heap_hi() && p >= mem_heap_lo();
}

/*
 * Return whether the pointer is aligned.
 * May be useful for debugging.
 */
static int aligned(const void *p) {
    return (size_t)ALIGN(p) == (size_t)p;
}

void link_print() {
	int i, node;
	for (i = 0; i < THRESHOLD; i++) {
		node = linkstart[i];
		if (node != 1){
			printf("%d: ", (i + 2) << 3);
			while (node != 1) {
				printf("%d ", node);
				assert(!ALLOC_TAG(heapstart + node));
				assert(FREE_SIZE(heapstart + node) == (i + 2) << 3);
				node = FREE_NEXT(heapstart + node);
			}
			puts("");
		}
	}
}

void splay_print(int node) {
	void *ptr = heapstart + node;
	if (FREE_CHILD(ptr, 0) != 1)
		return;
	splay_print(FREE_CHILD(ptr, 0));
	printf("%d: %d\n", FREE_SIZE(ptr), node);
	splay_print(FREE_CHILD(ptr, 1));
}

/*
 * mm_checkheap
 */
void mm_checkheap(int verbose) {
	void *ptr = heapstart;
	int size;
	int free = 0;

	while (ptr <= mem_heap_hi()) {
		if (ALLOC_TAG(ptr)) {
			assert(PREV_FREE_TAG(ptr) == (free == 1));
			free = 0;
			ptr += ALLOC_SIZE(ptr);
		} else {
			assert(free != 1);
			free = 1;
			if (FREE_TYPE(ptr) == 3) {
				ptr += 8;
				assert(PREV_FREE_SIZE(ptr) == 8);
			} else {
				size = FREE_SIZE(ptr);
				if (FREE_TYPE(ptr) == 2) {
					assert(ptr - heapstart ==
							FREE_NEXT(heapstart + FREE_PREV(ptr)));
					if (FREE_NEXT(ptr) != 1)
						assert(ptr - heapstart ==
								FREE_PREV(heapstart + FREE_NEXT(ptr)));
				} else if (size <= (THRESHOLD + 1) << 3) {
					assert(FREE_CHILD(ptr, 0) == 0);
					assert(linkstart[(size >> 3) - 2] ==
							ptr - heapstart);
					if (FREE_NEXT(ptr) != 1)
						assert(ptr - heapstart ==
								FREE_PREV(heapstart + FREE_NEXT(ptr)));
				} else {
					assert(FREE_CHILD(ptr, 0) == 1 ||
							!ALLOC_TAG(heapstart +
								FREE_CHILD(ptr, 0) + 4));
					assert(FREE_CHILD(ptr, 1) == 1 ||
							!ALLOC_TAG(heapstart +
								FREE_CHILD(ptr, 1) + 4));
					if (FREE_NEXT(ptr) != 1)
						assert(ptr - heapstart ==
								FREE_PREV(heapstart + FREE_NEXT(ptr)));
				}
				ptr += size;
				assert(PREV_FREE_SIZE(ptr) == size);
			}
		}
		assert(aligned(ptr + 4));
	}
	assert(ptr == mem_heap_hi() + 1);
	if (verbose > 1) {
		link_print();
		splay_print(splay_root);
		puts("");
	}
}
