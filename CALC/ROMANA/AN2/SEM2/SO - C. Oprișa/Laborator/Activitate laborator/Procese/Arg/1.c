#include <stdio.h>

int main(int argc, char** argv) {
    int a, b;

    if(argc < 3) {
        scanf("%d", &a);
        scanf("%d", &b);
    }
    else {
        sscanf(argv[1], "%d", &a);
        sscanf(argv[2], "%d", &b);
    }

    printf("%s %s", argv[1], argv[2]);


    return 0;
}
