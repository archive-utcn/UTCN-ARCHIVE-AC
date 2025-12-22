#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x=20,y=35;

    x = y++ + x++;
    y = ++y + ++x;
    printf("x = %d y= %d",x,y);
    return 0;
}
