#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    int minge = 0;
    int a2b[2], b2a[2];
    
    pipe(a2b);
    pipe(b2a);

    int p;
    p = fork();   
    if(p == 0) {
        while(minge < 10) {
            read(b2a[0], &minge, sizeof(int));
            printf("A: %d\n", minge);
            minge++;
            write(a2b[1], &minge, sizeof(int));
        }
        close(a2b[0]);
        close(a2b[1]);
        close(b2a[0]);
        close(b2a[1]);
        exit(0);
    } else {
        int q;
        q = fork();
        if(q == 0) {
            while(minge < 10) {
                read(a2b[0], &minge, sizeof(int));
                printf("B: %d\n", minge);
                minge++;
                write(b2a[1], &minge, sizeof(int));
            }
            close(a2b[0]);
            close(a2b[1]);
            close(b2a[0]);
            close(b2a[1]);
            exit(0);
        }
    }
    write(b2a[1], &minge, sizeof(int));
    wait(0);
    wait(0);
    close(a2b[0]);
    close(a2b[1]);
    close(b2a[0]);
    close(b2a[1]);
    return 0;
}
