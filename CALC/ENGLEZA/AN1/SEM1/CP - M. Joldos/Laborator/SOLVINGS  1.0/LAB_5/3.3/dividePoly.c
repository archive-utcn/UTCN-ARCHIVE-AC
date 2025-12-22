#include <stdio.h>

void dividePoly(double a[],int n,double b[],int m,double quotient[],int *quotient_deg,double remainder[], int *remainder_deg)
{
    int i,j,k;
    if(n<m)
    {
        *quotient_deg=0;
        quotient[0]=0.0;
        *remainder_deg=m;
        remainder=quotient;
    }
    else
    {
        *quotient_deg=n-m;
        *remainder_deg=m-1;
        for(i=n-m,j=n; i>=0; i--,j--)
        {
            quotient[i]=a[j]/b[m];
            for(k=m;k>=0;k--)
                a[i+k]-=quotient[i]*b[k];
            a[j]=0;
        }
        for(i=0;i<=m-1;i++)
            remainder[i]=a[i];

    }
}
