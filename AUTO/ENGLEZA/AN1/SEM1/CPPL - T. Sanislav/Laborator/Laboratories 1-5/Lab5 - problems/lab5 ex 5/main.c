#include <stdio.h>
#include <stdlib.h>

int multiple(int x, int y);

int main()
{
    int i = 0, x = 0, y = 0;
 for (i = 0; i < 3; i++)
 {
     printf("x= ");
     scanf("%d", &x);
     printf("y= ");
     scanf("%d", &y);
    if (multiple(x, y))
        printf("y is a multiple of x");
        else
        printf("y is not a multiple of x");
 }
}

int multiple(int x, int y)
{
    return !(y % x);
}
