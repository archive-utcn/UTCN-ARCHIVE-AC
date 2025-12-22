/* 29. Se da o matrice de nxn elemente 0 si 1. Sa se stabileasca daca matricea
respectiva este simetrica.*/

#include<stdio.h>
#include<stdlib.h>

int main()
{
int n,a[20][20],i,j,sim=1;
printf("\n Introduceti dimensiunea matricei ");
scanf("%d",&n);
printf("\n Introduceti elementele(0 si 1) matricei \n");
for(i=0;i<n;i++)
for(j=0;j<n;j++)
scanf("%d",&a[i][j]);
for(i=0;i<n-1;i++)
for(j=i+1;j<n;j++)
if(a[i][j]!=a[j][i])
sim=0;
if(sim==0) printf("\n Marticea nu este simetrica ");
else printf("\n Matricea este simetrica");
return 0;
}
