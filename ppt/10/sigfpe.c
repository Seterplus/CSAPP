#include <sys/types.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void sigfpe_handler(int sig) {
	printf("SIGFPE recieved.\n");
}

void sigint_handler(int sig) {
	printf("SIGINT recieved.\n");
}

int main() {
	int a = 1;
	signal(SIGFPE, sigfpe_handler);
	signal(SIGINT, sigint_handler);
	a = a / 0;
	printf("%d\n", a);
	return 0;
}
