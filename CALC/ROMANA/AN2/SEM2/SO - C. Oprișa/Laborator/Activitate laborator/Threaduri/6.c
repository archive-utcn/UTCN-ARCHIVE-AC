#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>

int sumImpar;
int sumPar;
char m[100];

void *func(void *param) {
	strcpy(m, param);
	int n = atoi(m);
	switch(n%2) {
		case 0: sumPar++;break;
		case 1: sumImpar++;
	}
	return NULL;
}

int main(int argc, char *argv[]) {
	pthread_t th[100];
	int i, n;
	for(i=1;i<argc;i++) {
		//n = atoi(argv[i]);
		//strcpy(m, argv[i]);
		pthread_create(&th[i], NULL, func, (void*)argv[i]);
		pthread_join(th[i], NULL);
		//printf("%d ", n);
		//printf("%s ", m);
	}
	printf("Pare: %d\nImpare: %d\n\n", sumPar, sumImpar);
	return 0;
}
  
