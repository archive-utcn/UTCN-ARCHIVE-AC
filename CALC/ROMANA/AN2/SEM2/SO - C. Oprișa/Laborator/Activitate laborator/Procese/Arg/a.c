#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
    int n1, n2;
    n1 = atoi(argv[1]);
    n2 = atoi(argv[2]);
    if(n1 == 0 || n2 == 0) {
        exit(2);
    }
    exit((n1 + n2)%2);
}
