#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

int main(){
	int a, b, c, a2b, b2a;
	a2b = open("a2b", O_RDONLY);
	b2a = open("b2a", O_WRONLY);
	read(a2b, &a, sizeof(int));
	read(a2b, &b, sizeof(int));
	c = a + b;
	write(b2a, &c, sizeof(int));
	close(a2b);
	close(b2a);
	return 0;
}
