#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>

void *func(void *t) {
	int x = *(int *)t;
	printf("Thread id: %li\n", pthread_self());
	return NULL;
}

int main() {
	int a = 0, b = 1;
	int rc1, rc2;
	pthread_t th1, th2;	
	if( rc1 = pthread_create(&th1, NULL, func, &a)) {
		perror("Error");
		exit(1);
	}
	if( rc2 = pthread_create(&th2, NULL, func, &b)) {
		perror("Error");
		exit(1);
	}
	pthread_join(th1, NULL);
	pthread_join(th2, NULL);
	return 0;
}
  
