#include <stdio.h>

int s[20],p[20],a[20][20],n,nr,i,j;
void df1(int nod)
{
int k;
s[nod]=nr;
for(k=1;k<=n;k++)
if ((a[nod][k]==1) && (s[k]==0))
df1(k);
}
void df2(int nod)
{
int k;
p[nod]=nr;
for(k=1;k<=n;k++)
if((a[k][nod]==1) && (p[k]==0))
df2(k);
}
void main()
{
    FILE *f;
f=fopen("grafo.txt","r");
 fscanf(f,"%d",&n);
while(fscanf(f,"%d",&i);) a[i][j]=1;
fclose(f);
nr=1;
for (i=1;i<=n;i++)
if (s[i]==0)
{
s[i]=nr;
df1(i);df2(i);
for(j=1;j<=n;j++)
if (s[j]!=p[j]) s[j]=p[j]=0;
nr++;
}
for(i=1;i<=n;i++)
{
printf("componenta  %d \n",i);
for(j=1;j<=nr;j++)
if(s[j]==1) printf("%d  ",j);
printf("\n");
}
}
