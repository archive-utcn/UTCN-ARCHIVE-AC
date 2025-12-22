#include <stdio.h>
#include <stdlib.h>
int a[20][20],p[20],d[20],n;
#define infinit 100000

void citire_matrice (int a[20][20],int n)
{
    FILE *pf;
    pf=fopen("matrice.txt","r");
    int i,j;
    fscanf(pf,"%d", &n);
    for (i=1; i<=n; i++)
    {
       for (j=1; j<=n; j++)
        {
            fscanf(pf,"%d",&a[i][j]);
            printf("%d ", a[i][j]);
        }
        printf("\n");
    }
}

void relax(int i,int j, int a[i][j])
 {if(d[j]>d[i]+a[i][j])
  {d[j]=d[i]+a[i][j];
   p[j]=i;
  }
 }

void init()
 { int i;
     for(i=1;i<=n;i++)
    {d[i]=infinit;
    p[i]=NULL;
    }
   d[1]=0;
 }

void bellman()
 {int i,j;
   init();
    for(i=1;i<=n;i++)
     for(j=1;j<=n;j++)
      relax(i,j,a[i][j]);
    for(i=1;i<=n;i++)
     for(j=1;j<=n;j++)
       if(d[j]>d[i]+a[i][j]) exit(0);
        //return 0;
   //return 1;
 }
int main()
{int i,n;
    citire_matrice(a,n);
    bellman();
    printf("%d", n);
    for(i=1;i<=n;i++)
    printf("xxx");
    return 0;
}
