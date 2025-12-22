/* Compute the product of matrices a[n][m] and b[m][p], of type double.
The result is stored in matrix c[n[][p] */
#define MAXN 10
void multiply_matrix(int n, int m, int p, double a[MAXN][MAXN],
double b[MAXN][MAXN], double c[MAXN][MAXN])
{
int i, j, k;
double s;
for(i=0; i<n; i++)
for(j=0; j<p; j++)
{
s=0.0;
for(k=0; k<m; k++)
s=s+a[i][k]*b[k][j];
c[i][j]=s;
}
}
