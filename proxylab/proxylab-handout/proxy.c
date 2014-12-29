/********************************************************************
 *                                                                  *
 * The cache module is naive(or wrong) and only works for proxylab! *
 *                                                                  *
 ********************************************************************/

#include <stdio.h>
#include "csapp.h"
#ifdef PROXY_CACHE
#include "cache.h"
#endif

#define log(func) fprintf(stderr, #func" error: %s\n%s%s:%d%s\n", \
		strerror(errno), \
		status.scm, \
		status.hostname, \
		status.port, \
		status.path)

struct status_line {
	char line[MAXLINE];
	char method[20];
	char scm[20];
	char hostname[MAXLINE];
	int  port;
	char path[MAXLINE];
	char version[20];
};

int parseline(char *line, struct status_line *status);
int send_request(rio_t *rio, char *buf,
		struct status_line *status, int serverfd, int clientfd);
int transmit(int readfd, int writefd, char *buf, int *count
#ifdef PROXY_CACHE
		,char *objectbuf, int *objectlen
#endif
		);
int interrelate(int serverfd, int clientfd, char *buf, int idling
#ifdef PROXY_CACHE
		,char *objectbuf, struct status_line *status
#endif
		);
void *proxy(void *vargp);

int main(int argc, char *argv[]) {
	if (argc != 2) {
		fprintf(stderr, "usage: %s <port>\n", argv[0]);
		exit(1);
	}

	signal(SIGPIPE, SIG_IGN);

	int port = atoi(argv[1]);
	int listenfd = Open_listenfd(port);

#ifdef PROXY_CACHE
	cache_init();
#endif

	while ("serve forever") {
		struct sockaddr clientaddr;
		socklen_t addrlen = sizeof clientaddr;
		int *clientfd = (int *)Malloc(sizeof(int));
		do *clientfd = accept(listenfd, &clientaddr, &addrlen);
		while (*clientfd < 0);

		pthread_t tid;
		Pthread_create(&tid, NULL, proxy, clientfd);
	}
}

#ifdef PROXY_CACHE
int cacheable(struct status_line *status) {
	return !strcmp(status->method, "GET");
}
#endif

int parseline(char *line, struct status_line *status) {
	status->port = 80;
	strcpy(status->line, line);

	if (sscanf(line, "%s %[a-z]://%[^/]%s %s",
				status->method,
				status->scm,
				status->hostname,
				status->path,
				status->version) != 5) {
		if (sscanf(line, "%s %s %s",
					status->method,
					status->hostname,
					status->version) != 3)
			return -1;
		*status->scm = *status->path = 0;
	} else
		strcat(status->scm, "://");

	char *pos = strchr(status->hostname, ':');
	if (pos) {
		*pos = 0;
		status->port = atoi(pos + 1);
	}
	return 0;
}

int send_request(rio_t *rio, char *buf,
		struct status_line *status, int serverfd, int clientfd) {
	int len;
	if (strcmp(status->method, "CONNECT")) {
		len = snprintf(buf, MAXLINE, "%s %s %s\r\n" \
				"Connection: close\r\n",
				status->method,
				*status->path ? status->path : "/",
				status->version);
		if ((len = rio_writen(serverfd, buf, len)) < 0)
			return len;
		while (len != 2) {
			if ((len = rio_readlineb(rio, buf, MAXLINE)) < 0)
				return len;
			if (memcmp(buf, "Proxy-Connection: ", 18) == 0 ||
					memcmp(buf, "Connection: ", 12) == 0)
				continue;
			if ((len = rio_writen(serverfd, buf, len)) < 0)
				return len;
		}
		if (rio->rio_cnt &&
				(len = rio_writen(serverfd,
								  rio->rio_bufptr, rio->rio_cnt)) < 0)
			return len;
		return 20;
	} else {
		len = snprintf(buf, MAXLINE,
				"%s 200 OK\r\n\r\n", status->version);
		if ((len = rio_writen(clientfd, buf, len)) < 0)
			return len;
		return 300;
	}
}

int transmit(int readfd, int writefd, char *buf, int *count
#ifdef PROXY_CACHE
		,char *objectbuf, int *objectlen
#endif
		) {
	int len;
	if ((len = read(readfd, buf, MAXBUF)) > 0) {
#ifdef PROXY_CACHE
		if (objectbuf && objectlen && *objectlen != -1) {
			if (*objectlen + len < MAX_OBJECT_SIZE) {
				memcpy(objectbuf + *objectlen, buf, len);
				*objectlen += len;
			} else
				*objectlen = -1;
		}
#endif
		*count = 0;
		len = rio_writen(writefd, buf, len);
	}
	return len;
}

int interrelate(int serverfd, int clientfd, char *buf, int idling
#ifdef PROXY_CACHE
		,char *objectbuf, struct status_line *status
#endif
		) {
	int count = 0;
	int nfds = (serverfd > clientfd ? serverfd : clientfd) + 1;
	int flag;
	fd_set rlist, xlist;
	FD_ZERO(&rlist);
	FD_ZERO(&xlist);

#ifdef PROXY_CACHE
	int objectlen = 0;
#endif

	while (1) {
		count++;

		FD_SET(clientfd, &rlist);
		FD_SET(serverfd, &rlist);
		FD_SET(clientfd, &xlist);
		FD_SET(serverfd, &xlist);

		struct timeval timeout = {2L, 0L};
		if ((flag = select(nfds, &rlist, NULL, &xlist, &timeout)) < 0)
			return flag;
		if (flag) {
			if (FD_ISSET(serverfd, &xlist) || FD_ISSET(clientfd, &xlist))
				break;
			if (FD_ISSET(serverfd, &rlist) &&
					((flag = transmit(serverfd, clientfd,
									  buf, &count
#ifdef PROXY_CACHE
									  ,objectbuf, &objectlen
#endif
									  )) < 0))
				return flag;
			if (flag == 0)
				break;
			if (FD_ISSET(clientfd, &rlist) &&
					((flag = transmit(clientfd, serverfd,
									  buf, &count
#ifdef PROXY_CACHE
									  ,NULL, NULL
#endif
									  )) < 0))
				return flag;
			if (flag == 0)
				break;
		}
		if (count >= idling)
			break;
	}
#ifdef PROXY_CACHE
	if (objectlen > 0 && cacheable(status))
		cache_add(status->line, objectbuf, objectlen);
#endif
	return 0;
}

void *proxy(void *vargp) {
	Pthread_detach(Pthread_self());

	int serverfd;
	int clientfd = *(int *)vargp;
	free(vargp);

	rio_t rio;
	rio_readinitb(&rio, clientfd);

	struct status_line status;

	char buf[MAXLINE];
	int flag;

#ifdef PROXY_CACHE
	char objectbuf[MAX_OBJECT_SIZE];
#endif

	if ((flag = rio_readlineb(&rio, buf, MAXLINE)) > 0) {
		if (parseline(buf, &status) < 0)
			fprintf(stderr, "parseline error: '%s'\n", buf);
#ifdef PROXY_CACHE
		else if (cacheable(&status) &&
				(flag = cache_find(status.line, objectbuf))) {
			if (rio_writen(clientfd, objectbuf, flag) < 0)
				log(cache_write);
		}
#endif
		else if ((serverfd =
					open_clientfd(status.hostname, status.port)) < 0)
			log(open_clientfd);
		else {
			if ((flag = send_request(&rio, buf,
							&status, serverfd, clientfd)) < 0)
				log(send_request);
			else if (interrelate(serverfd, clientfd, buf, flag
#ifdef PROXY_CACHE
						,objectbuf, &status
#endif
						) < 0)
				log(interrelate);
			close(serverfd);
		}
	}
	close(clientfd);
	return NULL;
}
