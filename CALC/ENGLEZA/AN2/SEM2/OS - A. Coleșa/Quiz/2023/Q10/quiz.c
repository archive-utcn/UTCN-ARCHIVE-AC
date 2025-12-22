#include <pthread.h>
#include <fcntl.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#define FREE 1
#define BUSY 0
#define MAX_TH 5

int available_unit[MAX_TH] = {FREE, FREE, FREE, FREE, FREE};
int unit[MAX_TH] = {0,0,0,0,0};
semaphore s;

void limited_area(){
    int pos =-1;

    for (pos =0; pos<MAX_TH; pos++){
        if (available_unit[pos]==FREE){
            sem_wait(&s);
            available_unit[pos]= BUSY;
            sem_post(&s);
            break;
        }
    }
    unit[pos];
    available_unit[pos]=FREE;
}

int main(){
    sem_init(&s, 0, 5);
    
}