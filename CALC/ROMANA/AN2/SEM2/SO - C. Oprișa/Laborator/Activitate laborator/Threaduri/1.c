#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>

void *print(void *arg) {
  int i = *(int *)arg;
  printf("%d\n", i);
  return NULL;
}

int main() {
  int n, i;
  printf("n= ");
  scanf("%d", &n);
  pthread_t idLIst[n];
  for(i = 0; i < n; i++) { 
    if(pthread_create(&idLIst[i], NULL, print, &i) < 0) {
      perror("Error");
      exit(1);
    }
  }
  for( i = 0; i < n; i++) {
    pthread_join(idLIst[i], 0);
  }
  return 0;
}
  
