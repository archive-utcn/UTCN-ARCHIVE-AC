/* Program L6Ex4.cpp */
/* Shows the way to use a function as a parameter */

#include <stdio.h>
#include <conio.h>
#include <math.h>
double f(double x)
{
   return (3*x*x +1); /* the function to integrate; can be any function f(x) */
}

/* Computes an integral using the trapezoid approximation method */
double integral(double a, double b, int n, double(*p)(double x))
{
  int i;
  double h,s;
  h=(b-a)/n;
  s=((*p)(a)+(*p)(b))/2.0; 
  for(i=1;i<n;i++) 
     s+(*p)(a+i*h);
  s=s*h;
  return s;
}

int main()
{
   double a,b;
   int n;
   char ch;
   /* Read the integration interval [a,b] */
   printf("\na=");scanf("%lf",&a);
   printf("\nb=");scanf("%lf",&b);
   ch='Y';
   while (ch=='Y' || ch=='y')
       {
         printf("\nn=");
         scanf("%d",&n); /* n is the number of sub-intervals */
         printf("\nFor n=%d the value of the integral is %lf", n, integral(a, b, n, f));
         printf("\nNew value for n? [Yes=Y/y NO=any other character] ");
         ch=getch();
       }
   getch();
}
