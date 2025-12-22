#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

int ack(int n,int m)
{
  if (n==0) 
      return m+1;
  if (m==0) 
      return ack(n-1,1);
  return ack(n-1,ack(n,m-1)); 
}
 
int main()
{
 int n, m;
 printf("\n Please input the coefficients for the ackermann function : \n");
 scanf("%d%d",&n,&m);
 printf("ack(%d, %d) = %d\n",n,m,ack(n,m));   
 getch();    
}
