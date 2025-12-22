#include "conio.h"
#include "stdio.h"

#define nmax 10

void read(int *n,int *m,double a[nmax][nmax]);
void display(int n,int m,double a[nmax][nmax],char ch);
void product(int n, int m, int p, double a[nmax][nmax], double b[nmax][nmax],double c[nmax][nmax]);
void invert(int n, double a[nmax][nmax], double eps,double b[nmax][nmax], double *det_a, int *err);

int main()
{ 
  int i,j,n,m,err;
  double eps,det_a,a[nmax][nmax],a1[nmax][nmax],b[nmax][nmax],c[nmax][nmax];
  read(&n, &m, a);
  display(n,m,a,'A');
  getch();
  for (i=0;i<n;i++)
      for (j=0;j<n;j++)
          a1[i][j]=a[i][j];
  eps=1.0e-6;
  invert(n,a1,eps,b,&det_a,&err);
  if (err>=0)
     printf("\n Singular matrix,erorr code =%d\n",err);
  else
    { 
      printf("\n The inversed matrix is \n");
      display(n,n,b,'B');
      printf("\n The determinant is %8.4lf\n",det_a);
      product(n,n,n,a,b,c);
      printf("\n Checking C=A*B = O1");
      display(n,n,c,'C');
      getch();
   }
}
