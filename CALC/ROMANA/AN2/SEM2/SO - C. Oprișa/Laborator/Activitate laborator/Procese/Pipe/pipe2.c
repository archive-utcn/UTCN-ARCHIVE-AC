#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>

int main(){
	int p[2];
	pipe(p);
	int a=5;
	int b=7;
	if( fork() == 0 ){
		int suma;
		int x;
		int y;
		read(p[0],&x,sizeof(int));
		read(p[0],&y,sizeof(int));
		suma = x + y;
		if ( suma % 2 == 0 ) 
			printf(" suma e para(%d) \n",suma);
		else printf(" suma e impara(%d) \n",suma);
		exit(0);
	}
	else {
		write(p[1],&a,sizeof(int));
		write(p[1],&b,sizeof(int));
		wait(0);
	}
 	return 0;	
}
