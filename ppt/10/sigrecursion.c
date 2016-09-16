#include <sys/types.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void sig_usr1(int sig)
{
	printf("SIGUSR1 recieved.\n");
	kill(getpid(), SIGUSR1);
	printf("SIGUSR1 ended.\n");
}

int main()
{
	signal(SIGUSR1, sig_usr1);
	kill(getpid(), SIGUSR1);
	return 0;
}
