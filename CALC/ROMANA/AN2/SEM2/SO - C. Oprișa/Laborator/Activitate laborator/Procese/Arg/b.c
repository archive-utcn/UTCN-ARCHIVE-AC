#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char* argv[]) {
    int i, a = 0, b = 0, c = 0, stare;
    for(i = 1; i <= argc; i+=2) {
        if(fork() == 0) {
            execl("./a", "./a", argv[i], argv[i+1], NULL);
            }
        }
    for(i = 1; i <= argc; i+=2) {
        wait(&stare);
        switch(WEXITSTATUS(stare)) {
            case 0: a++; break;
            case 1: b++; break;
            default: c++;
         }
    }
    printf("%d %d %d", a, b, c);
    return 0;
}
