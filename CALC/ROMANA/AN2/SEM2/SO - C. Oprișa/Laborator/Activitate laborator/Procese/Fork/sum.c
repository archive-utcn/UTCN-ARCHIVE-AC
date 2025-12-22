#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    int arr[4] = {1, 2, 3, 4};
    int c2p[2];
    
    pipe(c2p);
    int p;
    p = fork();
    if(p == 0) {
        arr[2] += arr[3]; 
        write(c2p[1], &arr[2], sizeof(int));
        close(c2p[0]);
        close(c2p[1]);
        exit(0);
    }
    arr[0] += arr[1];
    wait(0);
    read(c2p[0], &arr[2], sizeof(int));
    arr[0] += arr[2];
    printf("\n%d\n", arr[0]);
    close(c2p[0]);
    close(c2p[1]);
    return 0;
}
