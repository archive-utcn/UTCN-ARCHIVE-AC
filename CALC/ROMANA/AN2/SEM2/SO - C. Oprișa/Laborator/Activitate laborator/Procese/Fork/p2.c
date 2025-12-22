#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>

int sum = 0;

int main() {
    int i, fiu, sum1 = 0, sum2 = 0;
    for(i=0; i<10; i++) {
        fiu = fork();
        if(fiu == 0) {
            sum1 += 1;
            printf("Sum1: %d\n", sum1);
            exit(0);
        }
        else {
            sum2 += 1;
            printf("Sum2: %d\n", sum2);
        }
    }
    for(i=0; i<10; i++) {
        wait(0);
    }
    return 0;
}
