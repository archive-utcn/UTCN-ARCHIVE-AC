#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

int a[100];
int n;

int value(int x)
//returns the Value P(x)
{
  int res=0;
  long pow=1;
  for (int i=0;i<=n;i++)
  {
    res+=pow*a[i];
    pow*=x;
  }
  return res;
}

int main()
{
  printf("\n Please input the degree of the polynomial : \n");//we read the polinomial
  scanf("%d",&n);
  int i;
  
  for (i=n;i>=0;i--)
  {
    printf("\n Please input the coefficient of the power a%d = \n",i);
    scanf("%d",a+i);
  }
  
  int Q = a[0]/a[n];
  if (a[0]%a[n]) 
    {
      printf("\n Error!!!!!=\n");
      getch();
      exit(0);
    }
  
  printf("\nThe sollutions are : \n{ ");//we calculate the sollution
  for (i=1;i*i<=Q;i++)
    if (!(Q%i))
       {
          if (value(i)==0) 
              printf("%d ", i);
          if (value(-i)==0) 
              printf("%d ", -i);
          if (Q/i!=i)
              {
                 if (value(Q/i)==0) 
                     printf("%d ", Q/i);
                 if (value(-Q/i)==0)
                     printf("%d ", -Q/i);
              }
       }
  printf(" }");
  
  getch ();
  return 0;
}
