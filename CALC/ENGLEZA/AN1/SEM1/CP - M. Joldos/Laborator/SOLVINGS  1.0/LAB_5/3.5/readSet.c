#include <stdio.h>

void readSet(double a[],int *len_a)
{
    int i;
    scanf("%d",len_a);
    //printf("%d",len_a);
    for(i=0; i<*len_a; i++)
    {
        scanf("%lf",&a[i]);
    }
}
