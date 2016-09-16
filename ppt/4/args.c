void call(int x, int y) {
	int a;
	int b;
	printf("%lx %lx\n", &x, &y);
	printf("%lx %lx\n", &a, &b);
}

int main() {
	call(1, 2);
	return 0;
}
