#include <stdio.h>
#include <stdlib.h>
//Se citesc doua multimi. Calculati intersectia, reuniunea si diferenta multimilor
int main()
{
     int v[50], w[50], in[50], r[100], d[50], j,k,i,l, n, m,x;
     printf("n=");
     scanf("%d",&n);
     printf("m=");
     scanf("%d",&m);
     for(i=0;i<n;i++)
       {
        printf("v[%d]=",i);
        scanf("%d",&v[i]);
       }
     for(i=0;i<m;i++)
       {
        printf("w[%d]=",i);
        scanf("%d",&w[i]);
       }
//intersectia
    i=0;
    k=0;
    l=0;
    while(i<n)
    {
        j=0;
        while(j<m)
        {
            if(v[i]==w[j])
               {
                   in[k]=v[i];
                   k++;
               }
             j++;
        }
        i++;
    }
    printf("Intersectia este:");
    for(i=0;i<k;i++)
        printf("%d",in[i]);
//reuniunea
   x=n;
    for(i=0;i<x;i++)
        r[i]=v[i];
    j=0;
    while(j<m)
    {
        i=0;
        while(i<x)
            if(r[i]==w[j])
                i++;
                else {
                        x++;
                        r[x]=w[j];
                        i++;
                }
        j++;
    }
    printf("\nReuniunea este:");
    for(i=0;i<=x;i++)
        printf("%d",r[i]);
    return 0;
}
