#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>

int arr[100];

void *change(void *i) {
  int pos = *(int *)i;
  arr[pos] = 1;
  return NULL;
}

int main() {
  int n, i;
  printf("n= ");
  scanf("%d", &n);
  pthread_t idList[n];
  for(i = 0; i < n; i++) { 
    arr[i] = 0;
  }
  for(i = 0; i < n; i++) { 
    if(pthread_create(&idList[i], NULL, change, &i) < 0) {
      perror("Error");
      exit(1);
    }
  }
  for( i = 0; i < n; i++) {
    pthread_join(idList[i], 0);
  }
  for( i = 0; i < n; i++) {
    printf("arr[%d] este %d\n", i, arr[i]);
  }
  return 0;
}
  
