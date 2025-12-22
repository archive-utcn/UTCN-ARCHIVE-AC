#include "conio.h"
#define nmax 10

void display(int n,int m,double a[nmax][nmax],char ch)
{ 
  int i,j;
  printf("\n The matrix %c is \n",ch);
  for (i=0;i<n;i++)
      { 
         for (j=0;j<m;j++)
            printf("%8.2lf",a[i][j]);
         printf("\n");
      }
}

void read(int *n,int *m,double a[nmax][nmax])
{ 
  int i,j;
  printf("\n Please input the numbers of lines \n");
  scanf("%d",n);
  printf("\n please input the numbers of colomns \n");
  scanf("%d",m);
  printf("\nPlease input the elements of the matrix \n");
  for (i=0;i<*n;i++)
      for (j=0;j<*m;j++)
           { 
              printf("\n Please input the element a[%d,%d]=\n",i,j);
              scanf("%lf",&a[i][j]);
           }
  printf("\n");
}


