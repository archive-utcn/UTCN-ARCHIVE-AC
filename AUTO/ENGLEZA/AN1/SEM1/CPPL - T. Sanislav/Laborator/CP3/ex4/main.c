#include <stdio.h>
#include <stdlib.h>

int main()
{
    int a = 1, b = 0;
     while (a<=5) {
        b=1;
        while(b<=a) {
            printf("%d",a);
            b++;
        }
        printf("\n");
        a++;
     }
    printf("Hello world!\n");
    return 0;
}
