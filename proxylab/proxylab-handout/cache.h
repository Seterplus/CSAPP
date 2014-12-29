#include <stdlib.h>
#include <string.h>
#include "csapp.h"

struct cache_block {
	long timeid;
	char *content;
	int content_length;
	char *line;
	struct cache_block *next, *prev;
};

#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400

void cache_init();
int cache_find(char *line, char *buf);
void cache_add(char *line, char *objectbuf, int objectlen);
