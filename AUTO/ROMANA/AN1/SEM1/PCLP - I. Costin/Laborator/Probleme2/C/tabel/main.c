#include <stdio.h>
#include <stdlib.h>

int main()
{
    float x, y;
    scanf("%4f %4f",&x, &y);
    if (y==0) return -1;
    printf("x\ty\tx+y\tx-y\tx*y\tx/y\n");
    printf("%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f",x,y,x+y,x-y,x*y,x/y);
    return 0;
}
