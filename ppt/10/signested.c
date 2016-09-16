#include <sys/types.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void sig_usr1(int sig)
{
	printf("SIGUSR1 started.\n");
	kill(getpid(), SIGUSR2);
	printf("SIGUSR1 ended.\n");
}

void sig_usr2(int sig)
{
	printf("SIGUSR2 started.\n");
	printf("SIGUSR2 ended.\n");
}

int main()
{
	signal(SIGUSR1, sig_usr1);
	signal(SIGUSR2, sig_usr2);
	kill(getpid(), SIGUSR1);
	return 0;
}
