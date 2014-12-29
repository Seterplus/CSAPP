#include "cache.h"

static int cache_size;
static long timecount;
static sem_t sem;
static struct cache_block *head;

void cache_init() {
	head = NULL;
	cache_size = 0;
	timecount = 0;
	Sem_init(&sem, 0, 1);
}

int cache_find(char *line, char *buf) {
	int len = 0;
	P(&sem);
	struct cache_block *ptr = head;
	for (; ptr; ptr = ptr->next)
		if (!strcmp(ptr->line, line)) {
			ptr->timeid = timecount++;
			memcpy(buf, ptr->content, ptr->content_length);
			len = ptr->content_length;
			break;
		}
	V(&sem);
	return len;
}

void cache_add(char *line, char *objectbuf, int objectlen) {
	struct cache_block *ptr;
	P(&sem);
	while (cache_size + objectlen >= MAX_CACHE_SIZE) {
		struct cache_block *ev = head;
		for (ptr = head; ptr; ptr = ptr->next) {
			if (ptr->timeid < ev->timeid)
				ev = ptr;
		}
		cache_size -= ev->content_length;
		if (ev->prev)
			ev->prev->next = ev->next;
		if (ev->next)
			ev->next->prev = ev->prev;
		if (ev == head)
			head = ev->next;
		free(ev->content);
		free(ev->line);
		free(ev);
	}
	cache_size += objectlen;
	ptr = (struct cache_block *)Malloc(sizeof (struct cache_block));
	ptr->timeid = timecount++;
	ptr->content = (char *)Malloc(objectlen);
	ptr->content_length = objectlen;
	memcpy(ptr->content, objectbuf, objectlen);
	ptr->line = (char *)Malloc(strlen(line) + 1);
	strcpy(ptr->line, line);
	if (head)
		head->prev = ptr;
	ptr->next = head;
	ptr->prev = NULL;
	head = ptr;
	V(&sem);
}
