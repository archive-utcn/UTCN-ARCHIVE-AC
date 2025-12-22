#include <stdio.h>

void intersection(double a[],int len_a, double b[], int len_b, double c[], int *len_c)
{
    int i,j,ok;
    *len_c=0;
    for(i=0; i<len_a; i++)
    {
        ok=0;
        for(j=0; j<len_b; j++)
        {
            if(a[i]==b[j])
                ok=1;
        }
        if(ok)
        {
            c[*len_c]=a[i];
            *len_c=*len_c+1;
        }
    }
}
