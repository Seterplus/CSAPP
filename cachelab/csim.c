/***********************************
 *
 * Name:	Guo Tiankui
 * userID:	1300012790@pku.edu.cn
 *
 ***********************************/

#include "cachelab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <getopt.h>

int s, E, b;
FILE *f;
int hit, miss, eviction;
typedef struct {
	int usedtime;
	unsigned tag;
} block;
block *cache;

void find(unsigned addr, int time) {
	unsigned tag = addr >> b >> s;
	int setindex = addr >> b ^ (tag << s);
	int i;
	block *cacherow = cache + E * setindex;
	block *evictionrow = cacherow;
	for(i = 0; i < E; i++) {
		if(cacherow[i].usedtime && cacherow[i].tag == tag) {
			cacherow[i].usedtime = time;
			hit++;
			return;
		} else if(!cacherow[i].usedtime) {
			miss++;
			cacherow[i].usedtime = time;
			cacherow[i].tag = tag;
			return;
		} else if(cacherow[i].usedtime < evictionrow->usedtime)
			evictionrow = cacherow + i;
	}
	miss++;
	eviction++;
	evictionrow->usedtime = time;
	evictionrow->tag = tag;
}

int main(int argc, char *argv[])
{
	int opt;
	char op;
	unsigned addr;
	int t = 0;
	while ((opt = getopt(argc, argv, "s:E:b:t:")) != -1) {
		switch (opt) {
			case 's':
				s = atoi(optarg);
				break;
			case 'E':
				E = atoi(optarg);
				break;
			case 'b':
				b = atoi(optarg);
				break;
			case 't':
				f = fopen(optarg, "r");
				break;
		}
	}
	cache = (block*)malloc(sizeof(block) * E << s);
	memset(cache, 0, sizeof(block) * E << s);
	while (fscanf(f, "%s%x,%*d\n", &op, &addr) > 0) {
		switch (op) {
			case 'M':
				hit++;
			case 'L':
			case 'S':
				find(addr, ++t);
		}
	}
	fclose(f);
	free(cache);
    printSummary(hit, miss, eviction);
    return 0;
}
