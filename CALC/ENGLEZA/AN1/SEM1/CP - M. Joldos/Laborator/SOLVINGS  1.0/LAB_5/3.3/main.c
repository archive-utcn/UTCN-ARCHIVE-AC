#include <stdio.h>
#include <stdlib.h>
#include "poly.h"


int main()
{
    double a[MAX_N],b[MAX_N],quotient[MAX_N],remainder[MAX_N],a1[MAX_N],b1[MAX_N],c[MAX_N*2];
    int i,n,m,quotient_deg,remainder_deg,n1,m1,p;
    char ca,cb;
    readPoly(a,&n,&ca);readPoly(b,&m,&cb);
    n1=n; m1=m;
    for (i=0; i<=n; i++) a1[i]=a[i];
    for (i=0; i<=m; i++) b1[i]=b[i];
    dividePoly(a,n,b,m,quotient,&quotient_deg,remainder,&remainder_deg);

     do
    {
        dividePoly(a,n,b,m,quotient,&quotient_deg,remainder,&remainder_deg);
        for (i=0; i<=m; i++)
             a[i]=b[i];
        n=m;
        for (i=0; i<=remainder_deg; i++)
             b[i]=remainder[i];
        m=remainder_deg;
    }
    while (remainder_deg!=0);
    printf("\nThe greatest common divisor is:\ngcd=");
    showPoly(a,n,'A');
    printf("\n");
    multiply(n1,a1,m1,b1,&p,c);
    dividePoly(c,p,a,n,quotient,&quotient_deg,remainder,&remainder_deg);
    printf("\nThe least common multiple is:\nlcm=");
    showPoly(quotient,quotient_deg,'Q');
    return 0;
}
