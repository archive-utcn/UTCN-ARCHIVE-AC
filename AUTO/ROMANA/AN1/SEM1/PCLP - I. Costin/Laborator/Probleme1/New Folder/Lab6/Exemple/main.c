/* Programul L6Ex4.cpp */

/* Programul exemplifica modul de folosire
    a unei functii ca parametru */
#include <stdio.h>
#include <conio.h>
#include <math.h>
double fct(double x)
{
    int n,i;
    printf("gradul functiei este ");
    scanf("%d",n);
    for(i=0,i<=n;i++)
{

}
  return (f);
}
double integrala(double a,double b,int n,double(*p)(double x))
/* Calculul integralei prin metoda trapezelor */
{
  int i;
  double h,s;
  h=(b-a)/n;
  s=((*p)(a)+(*p)(b))/2.0;
  for(i=1;i<n;i++)
    s=s+(*p)(a+i*h);
  s=s*h;
  return s;
}
int main()
{
 double a,b;
 int n;
 char ch;
 /* Citirea intervalului de integrare */
 printf("\na=");scanf("%lf",&a);
 printf("\nb=");scanf("%lf",&b);
 ch='D';
 while (ch=='D' || ch=='d')
  {
   printf("\nn=");scanf("%d",&n);
   printf("\nPentru n=%d Valoarea integralei este %lf",n,
	     integrala(a,b,n,f));
   printf("\nApasati o tasta\n");getch();
   printf("\nIntroduceti alt n? DA=D/d NU=alt caracter ");
   ch=getch();
  }
  return(0);
}
