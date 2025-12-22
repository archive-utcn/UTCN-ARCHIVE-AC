#include<conio.h>
#include<stdio.h>


int a[20][20],n,i,j,viz[20],t[30],r,min,poz,d[20];


void drum(int i)
{if (t[i]!=0)
      {drum(t[i]);
       printf("%d ",i);
      }
   else printf("%d ",i);
}

void Dijkstra()

{printf("r=" );scanf("%d",&r);
for(i=1;i<=n;i++)
   {viz[i]=0;
    t[i]=0;
   }
    viz[r]=1;
for(i=1;i<=n;i++)
       {d[i]=a[r][i];
       if ((i!=r) && (d[i]!=30000))
       t[i]=r;
       }
for(i=1;i<=n-1;i++)
{
    min=30000;
    for(j=1;j<=n;j++)
      {
    if ((viz[j]==0) &&(d[j]<min))
     {
      min=d[j];
      poz=j;
     }
      }
     viz[poz]=1;
   for(j=1;j<=n;j++)
    if((viz[j]==0) && (d[j]>d[poz]+a[poz][j]))
      {
       d[j]=d[poz]+a[poz][j];
       t[j]=poz;
      }
}
for(i=1;i<=n;i++)
if(i!=r)
    {printf("n drumul de cost minim de la %d la %d=%dn",r,i,d[i]);
     drum(i);
    }
}


int main()
{
printf("dati n:" );scanf("%d",&n);
for(i=1;i<=n;i++)
for(j=1;j<=n;j++)
{
  printf("a[%d][%d]=",i,j);scanf("%d",&a[i][j]);
  a[i][i]=0;
}
printf("\nschema grafului este:\n" );
for(i=1;i<=n;i++)
{
  for(j=1;j<=n;j++)
  printf("%4d",a[i][j]);
  printf("n" );
}
Dijkstra();
getch();
}
