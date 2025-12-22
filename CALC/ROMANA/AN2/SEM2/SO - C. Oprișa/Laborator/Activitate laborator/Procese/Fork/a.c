#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main() {
    int p = fork();
    if (p < 0) {
        printf("Error");
    }
    if( p > 0) {
        printf("Hey");
        wait(0);
    }
    else {
        char a[5];
        scanf("%s", a);
        while (strcmp(a,"da") != 0) {
            printf("Salut");
            scanf("%s", a);
        }
    }
    return 0;
}
    
