#include <stdio.h>
#include <conio.h>
#include <math.h>

int a[10][10],b[10][10],c[10][10],s[10][10],s1[10][10],s2[10][10];
int i,j,n;

void citire(int a[10][10],int n)//read the matrix
{
    printf("\n Please input the matrix \n");
    for (i=1;i<=n;i++)
        {
            for (j=1;j<=n;j++)
                {
                   printf("\n input the element [%d][%d]\n",i,j);
                   scanf("%d",&a[i][j]);
                }
        }
}

void display(int a[10][10], int n)//display the matrix
{
     for (i=1;i<=n;i++)
         {
            for (j=1;j<=n;j++)
                printf("%d ",a[i][j]);
           printf("\n\n");           
         }
}

void addition(int a[10][10],int b[10][10],int s[10][10], int n)//sum of matrices
{
    for (i=1;i<=n;i++)
        for (j=1;j<=n;j++)
            s[i][j]=0;
            
    for (i=1;i<=n;i++)
        for (j=1;j<=n;j++)
            s[i][j]=a[i][j]+b[i][j]; 
}

void difference(int a[10][10],int b[10][10],int s[10][10], int n)//difference of matrices
{
    for (i=1;i<=n;i++)
        for (j=1;j<=n;j++)
            s[i][j]=0;
            
    for (i=1;i<=n;i++)
        for (j=1;j<=n;j++)
            s[i][j]=a[i][j]-b[i][j]; 
}

void product(int a[10][10],int b[10][10],int s[10][10], int n)//product or matrices
{
    int k;
    for (i=1;i<=n;i++)
        for (j=1;j<=n;j++)
            s[i][j]=0;
            
   for (i=1;i<=n;i++)
        {
           for (j=1;j<=n;j++)       
          {
            for (k=1;k<=n;k++)
               s[i][j]=s[i][j]+a[i][k]*b[k][j]; 
          }       
        }
        
}

void expression(int s2[10][10], int b[10][10], int c[10][10], int n)//expression of matrices B*C-2*(B+C)
{
      product(b,c,s,n);
      addition(b,c,s1,n);
      for (i=1;i<=n;i++)
          for (j=1;j<=n;j++)
              s2[i][j]=s[i][j]-2*s1[i][j];
}
 
int main()
{
    printf("\n Please input the number of columns and rows \n");//read the matrices A, B and C
    scanf("%d",&n);
    citire(a,n);
    citire(b,n);
    citire(c,n);
    addition(a,b,s,n);
    printf("The addition of matrix a and b is: \n");//display the sum
    display(s,n);
    difference(a,b,s,n);
    printf("The difference of matrix a and b is: \n");//display the difference
    display(s,n);
    product(a,b,s,n);
    printf("The product of matrix a and b is: \n");//display the product
    display(s,n);
    expression(s2,b,c,n);
    printf("The expressiom is: \n");//display the expression
    display(s2,n);
    getch();
}
