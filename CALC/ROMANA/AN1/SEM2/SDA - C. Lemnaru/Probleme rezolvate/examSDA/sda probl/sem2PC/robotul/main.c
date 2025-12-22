#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
# define max 10

void add(int x,int a[max][max])
{
    int i,j;
      for(i=0;i<x;i++)
        for(j=0;j<x;j++)
          {
              scanf("%d",&a[i][j]);
          }
}

void afisare(int x,int a[max][max])
{
    int i,j;
      for(i=0;i<x;i++)
        for(j=0;j<x;j++)
          {
              printf("%d ",a[i][j]);
              if(j==(x-1)) printf("\n");
          }
}

void init(int a[max][max],int x)
{
    int i,j;
     for(i=0;i<x;i++)
      for(j=0;j<x;j++)
        a[i][j]=0;
}

void caut(int x,int a[max][max],int b[max],int *dim)
{
    int i=0,j=0,k=1;
     do{
         b[0]=a[0][0];
          if(a[i+1][j]>a[i][j+1])
            {
                b[k]=a[i+1][j];
                i++;
                k++;
            }
          else
            {
                b[k]=a[i][j+1];
                j++;
                k++;
            }

       }while(i!=x && j!=x);


 *dim=k;
}

void afis_rez(int k,int b[max])
{
    int i;
     for(i=0;i<(k-1);i++)
      {
          printf("%d  ",b[i]);
      }
}

int main()
{
    int x,k,a[max][max],b[max];
     printf("Dim: ");
      scanf("%d",&x);
    init(a,max);
    add(x,a);
    printf("\n");
    afisare(x,a);
    caut(x,a,b,&k);
    printf("\n");
    afis_rez(k,b);
   return 0;
}
