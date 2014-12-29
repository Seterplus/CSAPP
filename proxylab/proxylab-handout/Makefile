CC = gcc
#CFLAGS = -g -Wall
CFLAGS = -O2 -Wall
LDFLAGS = -lpthread -pthread

all: proxy

csapp.o: csapp.c csapp.h
	$(CC) $(CFLAGS) -c csapp.c

cache.o: cache.c csapp.h
	$(CC) $(CFLAGS) -c cache.c

proxy.o: proxy.c cache.h csapp.h
	$(CC) $(CFLAGS) -c proxy.c -DPROXY_CACHE

proxy: cache.o proxy.o csapp.o

submit:
	(make clean; cd ..; tar cvf proxylab.tar proxylab-handout)

clean:
	rm -f *~ *.o proxy core

