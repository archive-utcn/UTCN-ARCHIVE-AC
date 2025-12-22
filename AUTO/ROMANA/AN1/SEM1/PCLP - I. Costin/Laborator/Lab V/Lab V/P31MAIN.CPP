/* Program to compute the reciprocal matrix of a square matrix and Its determinant
value */
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#define MAXN 10
extern void display_matrix(int n, int m, double a[MAXN][MAXN], char ch);
extern void read_matrix(int *n, int *m, double a[MAXN][MAXN]);
extern void multiply_matrix(int n, int m, int p, double a[MAXN][MAXN],
double b[MAXN][MAXN], double c[MAXN][MAXN]);
extern void reciprocal_matrix(int n, double a[MAXN][MAXN], double eps,
double b[MAXN][MAXN], double *det_a, int *err);
int main()
{
int i, j, n, m, err;
double eps, det_a, a[MAXN][MAXN], a1[MAXN][MAXN],
b[MAXN][MAXN], c[MAXN][MAXN];
system("cls");
read_matrix(&n, &m, a);
display_matrix(n, m, a, 'A');
getch();
for(i=0; i<n; i++)
for(j=0; j<n; j++) a1[i][j]=a[i][j];
eps=1.0e-6;
reciprocal_matrix(n, a1, eps, b, &det_a, &err);
if(err == 1) printf("\nMATRIx IS SINGULAR");
else
{
printf("\nReciprocal matrix B=A^(-1)\n");
display_matrix(n, n, b, 'B');
printf("\nDeterminant of matrix A IS %8.4lf", det_a);
multiply_matrix(n, n, n, a, b, c);
printf("\nCHECK THAT C=A*B RESULTS IN THE UNIT MATRIX.");
display_matrix(n, n, c, 'C');
getch();
}
}
