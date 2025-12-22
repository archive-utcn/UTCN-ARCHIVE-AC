
#include <stdio.h>
#include <stdlib.h>
#include<conio.h>
#include<math.h>
double c[20];
int m;
void citire_polinom (double c[],int *m)
{
printf("introduceti gradul functiei");
scanf("%d",m);
printf("introduceti coeficientii polinomului incepand de la Po");
int i;
for(i=0; i<=*m; i++)
{
printf("c%i=",i);
scanf("%lf",&c[i]);
}

}

double val_polinom(double x,int m,double c[])
{
int i;
double v;
v=0.0;
for(i=m;i>=0;i--)
v=v*x+c[i];
return v;
}
double integrala (double a,double b,int n,double (*val_polinom)(double x,int m,double c[]))
{
int i;
double h,s; //s inseamna aria subgraficul functiei; h inaltimea corespunzatoare trapezului;
h=(b-a)/n;
s=((*val_polinom)(a,m,c)+(*val_polinom)(b,m,c))/2.0;
for (i=1;i<n;i++)
s=s+(*val_polinom)(a+i*h,m,c);
s=s*h;
return s;
}

int main()
{

double a,b;
int n;
printf("a=");
scanf("%lf",&a);
printf("b=");
scanf("%lf",&b);
printf("n=");
scanf("%d",&n);
citire_polinom(c,&m);
printf("%lf",integrala(a,b,n,val_polinom));
return 0;
}
