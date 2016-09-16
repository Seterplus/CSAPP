#include <stdio.h>
#include <unistd.h>

int main() {
	sleep(1);
	int a = 1;
	printf("%lx %d\n", &a, a);
}
