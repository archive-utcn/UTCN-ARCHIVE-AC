#include <stdio.h>
#include <stdlib.h>

int main()
{
    int i = 1, j = 2, k = 3, m = 2;
    printf("%d\n", i==1);
    printf("%d\n", !m); //foarte ciudat ca are output 0
    printf("%d\n", !(j-m));
    printf("Hello world!\n");
    return 0;
}
