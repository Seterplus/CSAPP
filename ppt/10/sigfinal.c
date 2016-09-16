#include <sys/types.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int count = 0;

void sig_usr1(int sig)
{
	++count;
	printf("%d\n", count);
	kill(getpid(), SIGUSR2);
	--count;
}

void sig_usr2(int sig)
{
	++count;
	printf("%d\n", count);
	kill(getpid(), SIGUSR1);
	--count;
}

int main()
{
	signal(SIGUSR1, sig_usr1);
	signal(SIGUSR2, sig_usr2);
	kill(getpid(), SIGUSR1);
	return 0;
}
