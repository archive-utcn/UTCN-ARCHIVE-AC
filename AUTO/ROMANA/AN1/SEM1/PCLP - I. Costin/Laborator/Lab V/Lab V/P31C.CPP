/* Computes the reciprocal matrix of square matrix a of size n and
The value of its determinant, det_a, with precision eps */
#include <math.h>
#define MAXN 10
void reciprocal_matrix(int n, double a[MAXN][MAXN], double eps,
double b[MAXN][MAXN], double *det_a, int *err)
{
int i, j, k, maxpos;
double amax,aux;
/* Initialize matrix b with the unit matrix */
for(i=0; i<n; i++)
for(j=0; j<n; j++)
if(i==j) b[i][j]=1.0;
else b[i][j]=0.0;
/* Initialization of the value of the determinant */
*det_a=1.0;
/* Set to 0 all the elements under the main diagonal,
and to 1 those on the diagonal */
k=0; /* k=row number */
*err=0;
while( (k<n) && (*err==0) )
{
/* Calculate the pivot element */
amax=fabs(a[k][k]);
maxpos=k;
for(i=k+1; i<n; i++)
if (fabs(a[i][k]) > amax)
{
amax=fabs(a[i][k]);
maxpos=i;
}
/* Interchange row k cu rwo maxpos in matrices a and b */
if(k!=maxpos)
{
for(j=0; j<n; j++)
{
aux=a[k][j];
a[k][j]=a[maxpos][j];
a[maxpos][j]=aux;
aux=b[k][j];
b[k][j]=b[maxpos][j];
b[maxpos][j]=aux;
}
*det_a=-*det_a;
}
if( fabs(a[k][k]) < eps) *err=1;
else
{
*det_a =*det_a*a[k][k];
aux=a[k][k];
for(j=0; j<n; j++)
{
a[k][j]=a[k][j] / aux;
b[k][j]=b[k][j] / aux;
}
for(i=0; i<n; i++)
if(i != k)
{
aux=a[i][k];
for(j=0; j<n; j++)
{
    a[i][j]=a[i][j]-a[k][j]*aux;
b[i][j]=b[i][j]-b[k][j]*aux;
}
}
}
k++;
}
}
