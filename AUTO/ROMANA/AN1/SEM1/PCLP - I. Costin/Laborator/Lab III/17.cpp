#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

char S[100];

int main ()
{
  int N, B;
  printf("Input a number : ");//we read the number
  scanf("%d", &N);
  printf("Input base of conversion : ");//we read the base in which we want o convert the number
  scanf("%d", &B);
  if (B < 2 || B > 16) 
   {  
     printf("Invalid base"); //we test if the base we read is a valid one
     getch(); 
     return 0;
   }
  itoa(N, S, B);//we apply this formula to return the base conversion number

  printf("Conversion : %s", S);//we display the number 
  
  getch();
  return 0;
}
