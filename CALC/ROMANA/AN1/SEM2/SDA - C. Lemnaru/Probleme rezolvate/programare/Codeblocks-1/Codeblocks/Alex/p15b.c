#include <stdio.h>
#include <math.h>
int n;

void numere_prime(int n)
{
int i,j,prim;
printf("Numerele prime mai mici sau egale decat:\n");
for(i=2;i<=n;i++)
{
prim=1;
for(j=2;j<=i/2;j++)
if(i%j==0) prim=0;
if(prim==1) printf(i);
}
}

void main()
{
printf("n=");
scanf("%d",&n);
numere_prime(n);
}
