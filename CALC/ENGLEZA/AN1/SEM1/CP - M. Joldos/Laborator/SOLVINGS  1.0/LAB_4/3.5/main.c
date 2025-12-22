/* Program 3.5 */

#include <stdio.h>
#include <stdlib.h>
#define LENGTH 50


/* Read a matrix A, of dimensions n,m */
void read_matrix(int *n,int A[LENGTH][LENGTH])
{
    int i,j;
    printf("Introduce the number of rows n=");
    scanf("%d",n);

    printf("Introduce the elements of matrix A: \n");
    for(i=0;i<*n;i++)
    {
        for(j=0;j<*n;j++)
        {
            printf("A[%d][%d]= ",i,j);
            scanf("%d",&A[i][j]);
        }
        printf("\n");
    }
    return ;
}

/* Write a matrix A, of dimensions n */
void write_matrix(int n,int A[][LENGTH])
{
    int i,j;

    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
        {
            printf("%2d ",A[i][j]);
        }
        printf("\n");
    }
    return;
}


/* Addition of two matrices */
//only matrices from the same kind
void addition(int n,int a[][LENGTH],int b[][LENGTH],int s[][LENGTH])
{
    int i,j;

    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
        {
            s[i][j]=a[i][j]+b[i][j];
        }
    }
    return ;
}

/* Subtraction of two matrices */
//only matrices from the same kind
void subtraction(int n,int a[][LENGTH],int b[][LENGTH],int s[][LENGTH])
{
    int i,j;

    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
        {
            s[i][j]=a[i][j]-b[i][j];
        }
    }
    return ;
}

/* Multiplication of two matrices */
//only matrices from the same kind
void multiplication(int n,int a[][LENGTH],int b[][LENGTH],int m[][LENGTH])
{
    int i,j,k;

    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
        {
           m[i][j]=0;
        }
    }

    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
        {
           for(k=0;k<n;k++)
           {
               m[i][j]+=a[i][k]*b[k][j];
           }
        }
    }
    return ;
}
int main()
{
    int n,A[LENGTH+1][LENGTH+1],B[LENGTH+1][LENGTH+1],C[LENGTH+1][LENGTH+1],D[LENGTH+1][LENGTH+1],E[LENGTH+1][LENGTH+1];

    read_matrix(&n,A);
    read_matrix(&n,B);

    addition(n,A,B,C);
    printf("A+B=\n");
    write_matrix(n,C);

    printf("A-B=\n");
    subtraction(n,A,B,D);
    write_matrix(n,D);

    printf("A*B=\n");
    multiplication(n,A,B,E);
    write_matrix(n,E);



    return 0;
}
