/* 22. Se da un sistem de n ecuatii liniare cu n necunoscute. Sa se scrie un program de rezolvare a
sistemului, folosind o metoda numerica.*/
#include<stdio.h>
#include<math.h>

     void submatrice(long int n,long int lin,long int col,long int a[20][20],long int b[20][20])
{
int i,j,c=0,l=1;
for(i=1;i<=n;i++)
for(j=1;j<=n;j++)
if(j!=col&&i!=lin) { c++;
	     if(c==n) {c=1;l++;}
	     b[l][c]=a[i][j];
	   }
}

long int det(long int a[20][20],long int n)
{
long int part,i,b[20][20],k,c,j,l,s=0;
if(n==1) { s=a[1][1];}

if(n==2) {
	    s=a[1][1]*a[2][2]-a[1][2]*a[2][1];}

else {
	for(i=1;i<=n;i++)
	{
	submatrice(n,1,i,a,b);
	s+=a[1][i]*pow(-1,i+1)*det(b,n-1);
	}
     }
return s;
}
int main()
{
    long int a[20][20],n,i,j,b[20],det_a=0,det_x,c[20];
    double x;
printf("dati numarul de necunoscute");
scanf("%ld",&n);
printf("\nDati coeficientii sistemului \n");
for(i=1;i<=n;i++)
    for(j=1;j<=n;j++)
    {
        printf("a[%ld][%ld]=",i,j);
        scanf("%ld",&a[i][j]);
    }
printf("\nDati coeficientii termenenilor liberi \n");
for(i=1;i<=n;i++)
{
    printf("b[%ld]=",i);
    scanf("%ld",&b[i]);
}
det_a=det(a,n);
for(j=1;j<=n;j++)
{
    for(i=1;i<=n;i++)
    {
        c[i]=a[i][j];
        a[i][j]=b[i];
    }
    det_x=det(a,n);
    for(i=1;i<=n;i++)
    a[i][j]=c[i];
        x=det_x/det_a;
    printf("x_%ld este %4.2lf \n",j,x);
}
return(0);
}

