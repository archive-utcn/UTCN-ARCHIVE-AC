#include<stdio.h>
#include<conio.h>
#include<math.h>
#include<alloc.h>
#include <stdlib.h>

float d(float *a,int n,float x0)//calculate the deivative
{ 
   float r; 
   int i;
   r=0;
   for(i=1;i<=n;i++)
       r=r+((*(a+i))*i*pow(x0,i-1));
   return r;
}

int main()
{ 
  float *a,x0; 
  int i,n;
  printf("\n Please input the degree of the polynomial: \n ");//we read the polynomial
  scanf("%i",&n);
  printf("\n Please input the coefficients of the polynomial: \n ");
  a=(float *) malloc(100);
  for(i=0;i<=n;i++) 
     scanf("%f",&(*(a+i)));
  printf("\nPlease input the point x0:\n ");//we read tha value x0
  scanf("%f",&x0);
  printf("\n The derrivative in the point x0 is %f",d(a,n,x0));//we calculate P'(x0)
  free(a);
  getch();
}
