#include <stdio.h>
#include <stdlib.h>
#include<alloc.h>
#include<conio.h>

void prod(float *a,int n,float *b,int m,float *c,int &p)//calculate the product of 2 polynomials
{ 
  int i,j;
  p=n+m;//the degree of the product polynomial is the sum of the 2 polynomial degrees
  for(i=0;i<=p;i++)
    *(c+i)=0;
  for(i=0;i<=n;i++)
    for(j=0;j<=m;j++)
       *(c+i+j)=(*(c+i+j))+((*(a+i))*(*(b+j)));
}

int main()
{  
   float *a,*b,*c; 
   int n,m,i,p;
   system("cls");
   a=(float *) malloc(100);
   b=(float *) malloc(100);
   c=(float *) malloc(100);
   
   printf("\n Please input the degree of the first polynomial: \n ");//read the first polynomial 
   scanf("%i",&n);
   printf("\n Please input the coefficients of the first polynomial: \n ");
   for(i=0;i<=n;i++) 
       scanf("%f",&(*(a+i)));
   printf("\n Please input the degree of the second polynomial: \n ");//read the second polynomial
   scanf("%i",&m);
   printf("\n Please input the coefficients of the second polynomial: \n ");
   for(i=0;i<=m;i++) 
       scanf("%f",&(*(b+i)));
   
   printf("\n The product is: \n ");//we calculate and display the polynomial product
   prod(a,n,b,m,c,p);
   printf("\n The degree is %i",*&p);
   printf("\n The polynomial is ");
   for(i=0;i<=p;i++) 
       printf(" %5.2f*x^%d +  ",*(c+i),i);
   getch();
}
