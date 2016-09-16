#include <stdio.h>

int isNaN(float x) {
	return !(x == x);
}

void test(int x) {
	float y = *(float *)&x;
	printf("%d %f\n", isNaN(y), y);
}
int main() {
	test(0x7F800000);
	test(0x7F800001);
	test(0x3F800000);
	return 0;
}
