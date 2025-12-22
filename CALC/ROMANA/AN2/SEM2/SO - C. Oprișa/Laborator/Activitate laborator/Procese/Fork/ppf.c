#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>

int main() {
    int minge = 0;
    int a2b, b2a;
    int p;
    p = fork();
    if(p == 0) {
        a2b = open("a2b", O_WRONLY);
        b2a = open("b2a", O_RDONLY);
        while(minge < 10) {
            read(b2a, &minge, sizeof(int));
            printf("A: %d\n", minge);
            minge++;
            write(a2b, &minge, sizeof(int));
        }
        close(a2b);
        close(b2a);
        exit(0);
    } else {
        int q;
        q = fork();
        if(q == 0) {
            a2b = open("a2b", O_RDONLY);
            b2a = open("b2a", O_WRONLY);
            while(minge < 10) {
                read(a2b, &minge, sizeof(int));
                printf("B: %d\n", minge);
                minge++;
                write(b2a, &minge, sizeof(int));
            }
            close(a2b);
            close(b2a);
            exit(0);
      }
    }
    b2a = open("b2a", O_WRONLY);
    write(b2a, &minge, sizeof(int));
    wait(0);
    wait(0);
    close(b2a);
    return 0;
}
