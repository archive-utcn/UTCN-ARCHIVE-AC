#include <stdio.h>

void reunion(double a[],int len_a,double b[],int len_b,double c[],int *len_c)
{
    int i,j,ok;
    *len_c=0;
    for(i=0; i<len_a; i++)
    {
        c[i]=a[i];
    }
    *len_c=len_a;
    for(i=0; i<len_b; i++)
    {
        ok=1;
        for(j=0; j<len_a; j++)
        {
            if(a[j]==b[i])
                ok=0;

        }
        if(ok)
        {
            c[*len_c]=b[i];
            *len_c=*len_c+1;
        }

    }
}
