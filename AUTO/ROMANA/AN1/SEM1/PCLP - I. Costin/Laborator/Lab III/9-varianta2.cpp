#include <conio.h>
#include <stdio.h>
# define MAXDEGREE 20
/* Multiply two polynomials, a(x) of degree n, and b(x) of degree m,
i.e. c(x)=a(x)*b(x) */
void multiply(int n, float a[], int m, float b[], int *p, float c[])
{
int i, j;
*p=n+m;
for(i=0; i<=n+m; i++) c[i]=0.0;
for(i=0; i<=n; i++)
for(j=0;j<=m;j++) c[i+j]+=a[i]*b[j];
}/* Divide polynomial a(x), of degree n, by polynomial b(x) of degree m
i.e. a(x)=b(x)*quotient(x)+remainder(x) */
void divide(int n, float a[], int m, float b[],
int *quotient_deg, float quotient[],
int *remainder_deg, float remainder[])
{
int i, j, k;
if (n<m)
{
*quotient_deg=0;
quotient[0]=0.0;
*remainder_deg=m;
remainder=quotient;
}
else
{
*quotient_deg=n-m;
*remainder_deg=m-1;
for(i=n-m, j=n; i>=0; i--, j--)
{
quotient[i]=a[j]/b[m];
for (k=m; k>=0; k--) a[i+k]=a[i+k]-quotient[i]*b[k];
a[j]=0;
}
for(i=0; i<=m-1; i++) remainder[i]=a[i];
}
}
/* Read the degree, n, and coefficients of polynomial a */
void read_polynomial(int *n, float a[])
{
int i;
printf("\nInput the degree of polynomial a: ");
scanf("%d", n);
for(i=0; i<=*n; i++)
{
printf("\na[%d]=", i);
scanf("%f", &a[i]);
}
printf("\n");
}
/* Evaluate polynomial a, of degree n, for a given value of x */
float evaluate_polynomial(float x, int n, float a[])
{
int i;
float v;
v=0.0;
for(i=n;i>=0;i--) v=v*x+a[i];
return v;
}
/* Show a polynomial a, of degree n, named as c */
void show_polynomial(int n, float a[], char c)
{
int i;
printf("\n%c[x]=%g", c, a[0]);
for(i=1; i<=n; i++) printf("+%g*x^%d", a[i], i);
printf("\n");
}
int main()
{
int n, m, r_deg, quotient_deg, remainder_deg;
float x, v, p[MAXDEGREE+1], q[MAXDEGREE+1], r[MAXDEGREE+1],
quotient[MAXDEGREE+1], remainder[MAXDEGREE+1];
//clrscr();
read_polynomial(&n, p);
show_polynomial(n, p, 'P');
read_polynomial(&m, q);
show_polynomial(m, q, 'Q');
printf("\nInput a value for the polynomial variable, x=");scanf("%f", &x);
v=evaluate_polynomial(x, n, p);
printf("Value of polynomial P on point x=%f is %f", x, v);
getch();
multiply(n, p, m, q, &r_deg, r);
printf("\nR[x]=P[x]*Q[x]\n");
show_polynomial(r_deg, r, 'R');
getch();
divide(n, p, m, q, &quotient_deg, quotient, &remainder_deg, remainder);
printf("\nDivision P[x]/Q[x] yields quotient C[x] and remainder R[x]\n");
show_polynomial(quotient_deg, quotient, 'C');
show_polynomial(remainder_deg, remainder, 'R');
getch();
printf("\nWARNING. The polynomial P is changed.\n");
show_polynomial(n, p, 'P');
getch();
return 0;
}
