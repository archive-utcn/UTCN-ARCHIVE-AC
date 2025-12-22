#include "stdio.h"
#include "conio.h"

int a[100],x[100],n,s=0,m[50][100];

int result(void)//*display the result
{ 
  int i;
  s++;
  printf("The solution of the number %d is \n",s);
  for (i=0;i<n;i++)
      printf("%d ",m[i][x[i]]);
  printf("\n");
}

void cartezian(int k)//calculate the cartesian product
{ 
  int i=0;
  for (;i<a[k];i++)
      { 
        x[k]=i;
        if (k==n-1)
           result();
        else
           cartezian(k+1);
      }
}

int main()
{ 
  int i=0,k;
  printf("\n Please input the numbers of elements\n");//read the elements of the sets
  scanf("%d",&n);
  for (;i<n;i++)
      { 
        printf("\nPlease input the numbers of elements of the set %d\n",i+1);
        scanf("%d",&a[i]);
        printf("\nPlease input the elements of the set %d\n",i+1);
        for (k=0;k<a[i];k++)
            scanf("%d",&m[i][k]);
      }
  printf("\nThe result \n");
  cartezian(0);
  getch();
}
