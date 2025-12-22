/* Read and display of a n*m element matrix with elements of type double */
#include <stdio.h>
#include <conio.h>
#define MAXN 10
void display_matrix(int n, int m, double a[MAXN][MAXN], char ch)
{
int i, j;
printf("\n MATRIX %c\n",ch);
for( i=0; i<n; i++)
{
for(j=0;j<m;j++) printf("%8.2lf ",a[i][j]);
printf("\n");
}
}
void read_matrix(int *n, int *m, double a[MAXN][MAXN])
{
int i,j;
printf("\nInput of size and elements of a matrix\n");
printf("\n\tNumber of rows, n=");
scanf("%d", n);
printf("\n\tNumber of columns, m=");
scanf("%d", m);
printf("\n\tThe elements of the matrix\n");
for (i=0;i<*n;i++)
for(j=0; j<*m; j++)
{
printf("a[%d,%d]=", i, j);
scanf("%lf",&a[i][j]);
}
printf("\n");
}
