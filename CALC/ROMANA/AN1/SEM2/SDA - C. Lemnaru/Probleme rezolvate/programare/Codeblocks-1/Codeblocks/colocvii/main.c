#include <stdio.h>
#include <stdlib.h>
int main()
{

long n,m;
long a[10],b[10];
int i,j,x,k,l;
printf("primul numar este ");
scanf("%ld",&n);
printf("al 2-lea numar este ");
scanf("%ld",&m);
x=0;
while(n>0)
{
    x++;
    a[x]=n%10;
    n=n/10;
}
k=x;
x=0;
while(m>0)
{
    x++;
    b[x]=m%10;
    m=m/10;
}
l=x;
x=0;
for(i=1;i<=k;i++)
    for(j=1;j<=l;j++)
    if(a[i]==b[j])
    x++;
printf("cele doua numere au %d cifre comune ",x);
return(0);
}
