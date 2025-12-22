#include <stdio.h>
#include <stdlib.h>
#include<math.h>

int n,nd,ndd,i;
float a[10], ad[10], add[10],y,s, z[10], max, w[10];
float c,d;

float f(float x) {
for(i=0; i<=n; i++)
{
    y=pow(x,i)*a[i];
    s=s+y;
}
   return s;//returneaza functia f in pct x
}  /* f  */

float f_der1(float x) {
for(i=0; i<=nd; i++)
{
    y=pow(x,i)*ad[i];
    s=s+y;
}
   return s; //returneaza calculul derivatei
}  /* f_der */


float f_der2(float x) {
for(i=0; i<=ndd; i++)
{
    y=pow(x,i)*add[i];
    s=s+y;
}
   return s; //returneaza calculul derivatei de ordin 2
}
void derivare(int n, float a[])
{
int i;
if(n==0)
    {
    ndd=0;
    add[0]=0;
    }
else
    {
    ndd=n-1;
    for(i=ndd; i>=0; i--)
        add[i]=(i+1)*a[i+1];
}
}

float newton(float x_0, float tol, int max_iter,int* iter_p, int* converge_p) {
   float x = x_0;
   float x_prev;
   int   iters = 0;
   do {
      iters++;
      x_prev = x;
      x = x_prev - f_der1(x_prev)/f_der2(x_prev);
   } while (fabs(x - x_prev) > tol && iters < max_iter);

   if (fabs(x - x_prev) <= tol)
      *converge_p = 1;
   else
      *converge_p = 0;
   *iter_p = iters;

   return x;
}  /* algoritmul lui newton de aproximare a radacinilor */

int main() {
FILE *fi;
   float x_0;       /* prima ghicire                 */
  // float x;         /* solutia aproximativa         */
   float tol;       /* eroarea maxima                */
   int    max_iter; /* nr. maxim de iteratii */
   int    iter;     /* nr. de iteratii  */
   int    converge; /* daca iteratia converge  */
   int j,k;
   float m;
   fi= fopen("functie4.txt", "r");

//printf("dati capetele intervalului \n");
fscanf(fi,"%f %f", &c, &d);
printf("intervalul este [%7.2f,%7.2f] \n", c,d);
//printf("dati gradul polinomului ");
fscanf(fi,"%d", &n);

//printf("dati coeficientii polinomului ");
	for(i=0; i<=n; i++)
        fscanf(fi," %f", &a[i]);
printf("Coeficientii polinomului sunt \n");
    for(i=n; i>=0; i--)
        printf("%7.2f \n", a[i]);
derivare(n,a);

printf(" \n coeficientii polinomului dupa derivare \n");
for(i=ndd; i>=0; i--)
    printf("%7.2f \n", add[i]);
for(i=0; i<=ndd; i++)
    ad[i]=add[i];
nd=ndd;
derivare(nd,ad);
/*printf(" \n coeficientii polinomului dupa derivare \n");
for(i=ndd; i>=0; i--)
    printf("%7.2f \n", add[i]);*/
printf("\n");
printf("Radacinile derivatei sunt \n");
for(j=0; j<nd; j++)
{
   //printf("Introduceti x_0, tol, and max_iters\n");
   fscanf(fi,"%f %f %d", &x_0, &tol, &max_iter);

    z[j] = newton(x_0, tol, max_iter, &iter, &converge);

   if (converge) {
        printf("Algoritmul converge dupa %d pasi.\n",iter);
        printf("Solutia aproximativa este %7.3f\n", z[j]);
        printf("f(%7.3f) = %7.3f\n", z[j], f(z[j]));
        printf("\n");
   }
   else {
    printf("Algoritmul nu converge dupa %d pasi.\n",iter);
    printf("Ultima val estimata este %7.3f\n", z[j]);
    printf("f(%7.3f) = %7.3f\n", z[j], f(z[j]));
    printf("\n");
  }
}

k=0;
for(j=0; j<nd; j++)
    if((z[j]>c) && (z[j]<d))
    {
        w[k]=z[j];
        k++;
    }

max=f(w[0]);
m=w[0];
for(j=0; j<k; j++)
    if(f(w[j])>max)
    {
        max= f(w[j]);
        m = w[j];
    }
    if(max< f(c)) {max=f(c); m=c;}
        else
            if(max<f(d)) {max= f(d); m=d;}
printf("maximul functiei este in pct x= %7.3f \n" ,m);
printf("functia are valoarea %7.3f \n", max);
/* main */
return 0;
}
