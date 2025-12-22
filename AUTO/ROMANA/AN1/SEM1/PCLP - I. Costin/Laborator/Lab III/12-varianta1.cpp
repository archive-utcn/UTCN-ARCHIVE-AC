/*
  Q (x)    n      ai
 ------ = Sum -----------
  P (x)   i=1  bi*x + ci
*/

#include <stdio.h>
#include <conio.h>
#include "poli.h"
#include <stdlib.h>

int n, a, b, c;

void WError ()
{
  printf("Term cannot be something divided by zero !");
  getch();
  exit(0);
}

int main ()
{
  Poli P, Q;
  P.Empty();
  Q.Empty();
  
  printf("Input the number of terms of the addition : ");
  scanf("%d", &n);
  printf("Now input for each term the coefficients a, b, c: \n");
  // for the first term we initialise the polinomials P and Q as given
  printf("Nr #1:\n");
  printf("a = "); 
  scanf("%d", &a);
  printf("b = ");
  scanf("%d", &b);
  printf("c = ");
  scanf("%d", &c);
  
  if (b == c && c == 0) WError();
  if (b == 0) 
  {
    P.deg = 0;
    P.A[0] = c;
  }
  else 
  {
    P.deg = 1;
    P.A[1] = b;
    P.A[0] = c;
  }
  Q.deg = 1;
  Q.A[0] = a;
  
  // for the rest terms we add them : 
  for (int i = 1;i < n;i++)
  {
    Poli aux1, aux2;
    aux1.Empty();
    aux2.Empty();
    
    printf("Nr #%d:\n", i + 1);
    printf("a = "); 
    scanf("%d", &a);
    printf("b = ");
    scanf("%d", &b);
    printf("c = ");
    scanf("%d", &c);
    
    if (b == c && c == 0) WError();
    if (b == 0) 
    {
      aux1.deg = 0;
      aux1.A[0] = c;
    }
    else 
    {
      aux1.deg = 1;
      aux1.A[1] = b;
      aux1.A[0] = c;
    }
    aux2.deg = 1;
    aux2.A[0] = a;
    
    Q = Q*aux1 + P*aux2;
    P = P*aux1;
  }
  
  printf("Q(X) : ");
  Q.PrintPoly();
  printf("P(X) : ");
  P.PrintPoly();
  
  getch();
  return 0;
}
