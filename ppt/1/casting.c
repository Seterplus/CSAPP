#include <stdio.h>
int a, g;
unsigned int b, h;
char c, d;
unsigned char e, f;
int main(){
	a = -1;b = -1;
	c = a;d = b;
	e = c;f = d;
	g = e;h = d;
	printf("%d\n", a);
	printf("%d\n", b);
	printf("%d\n", c);
	printf("%d\n", d);
	printf("%d\n", e);
	printf("%d\n", f);
	printf("%d\n", g);
	printf("%d\n", h);
}
