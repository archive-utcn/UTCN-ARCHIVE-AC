#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

int main(){
	int a, b, a2b, b2a;
	printf("a = ");
	scanf("%d", &a);
	printf("b = ");
	scanf("%d", &b);
	a2b = open("a2b", O_WRONLY);
	b2a = open("b2a", O_RDONLY);
	write(a2b, &a, sizeof(int));
	write(a2b, &b, sizeof(int));
	read(b2a, &a, sizeof(int));
	printf("Suma este %d\n", a); 
	close(a2b);
	close(b2a);
	return 0;
}
