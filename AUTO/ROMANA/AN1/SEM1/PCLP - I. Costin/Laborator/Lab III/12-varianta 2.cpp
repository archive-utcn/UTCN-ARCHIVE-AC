#include <stdio.h>
#include <conio.h>

void sum(int x[100],int n,int y[100],int m,int z[100])
{
int i;
if(n<m)
 {
 for(i=n+1;i<=m;i++)
  x[i]=0;
 n=m;
 }
if(m<n)
 {
 for(i=m+1;i<=n;i++)
  y[i]=0;
 m=n;
 }
for(i=0;i<=n;i++)
 z[i]=x[i]+y[i];
}

void prod(int x[100],int n,int y[100],int m,int z[100])
{
int i,j;
for(i=0;i<=n+m;i++)
 z[i]=0;
for(i=0;i<=n;i++)
 for(j=0;j<=m;j++)
  z[i+j]=z[i+j]+x[i]*y[j];
}

int main()
{
int i,j,x[100],l,y[100],k,a[100],b[100],c[100],ni,p[100],n,q[100],m,auxp[100],auxq[100];
printf("Give n: ");
scanf("%d",&ni);
printf("Give ai,bi,ci:");
for(i=0;i<ni;i++)
 scanf("%d %d %d",&a[i],&b[i],&c[i]);
n=0;
p[0]=0;
m=0;
q[0]=1;
for(i=0;i<ni;i++)
 {
 l=0;
 x[0]=a[i];
 k=1;
 y[0]=b[i];
 y[1]=c[i];
 prod(p,n,y,k,auxp);
 prod(q,m,x,l,auxq);
 sum(auxp,n+k,auxq,m+l,p);
 if(n+k>m+l)
  n=n+k;
 else
  n=m+l; 
 prod(q,m,y,k,auxq);
 x[0]=1;
 prod(x,l,auxq,m+k,q);
 m=m+k+l;
 }
printf("\nP(x)=");
for(i=0;i<ni-1;i++)
 printf("%d*x^%d + ",p[i],ni-1-i);
printf("%d*x^%d",p[ni-1],0);

printf("\nQ(x)=");
for(i=0;i<ni;i++)
 printf("%d*x^%d + ",q[i],ni-i);
printf("%d*x^%d",q[ni],0);
 
getch();
return (0);
}
