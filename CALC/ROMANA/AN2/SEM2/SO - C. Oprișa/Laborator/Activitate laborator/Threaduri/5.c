#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>

int par, impar;

void *func() {	


int randNum = rand()%(50-10 + 1) + 10;
	if(randNum % 2 == 0) {
		par++;
	} else {
		impar++;
	}	
	printf("Par: %d\nImpar: %d\n\n", par, impar);
	return NULL;
}

int main() {
	int i;
	pthread_t th[100];	
	for(i=0;i<=10;i++) {	
		pthread_create(&th[i], NULL, func, NULL);
		pthread_join(th[i], NULL);
	}
	return 0;
}
  
