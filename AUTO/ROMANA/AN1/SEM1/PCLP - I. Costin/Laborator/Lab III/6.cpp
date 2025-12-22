#include <stdio.h>
#include <conio.h>
#include <math.h>

int main()
{
  int n,uc,aux, n_inv;
  printf("\n Please input the value of number n \n");//we read the number n
  scanf("%5d",&n);
  aux=n;//we use an auxiliar variable, because we need to work on a copy of n
  uc=0;//this variable represent the last letter of n
  n_inv=0;//represent the number in which we want to calculate the palindrome
  while (aux !=0)//we do all these operation until we have aux==0
 {
  uc=aux%10;//we assign to uc teh rest of the division of aux with 10
  n_inv=n_inv*10+uc;//we add a nwe letter to palindrom
  aux=aux/10;//aux becomes aux/10
}
if (n==n_inv) //if the numbers are eqauls, then n is a palindrome
  printf("\nThe number is a palindrom\n");
  else
  printf("\nThe number isn't palindrom\n");
getch();

}

