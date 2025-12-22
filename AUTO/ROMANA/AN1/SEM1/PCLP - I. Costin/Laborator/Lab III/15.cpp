#include <stdio.h>
#include <conio.h>

int N;
int P[40];
int a, b;

int main ()
{
  
  printf("The number of questions : ");//we read the number of questions
  scanf("%d", &N);
 
  int i, sum; 
  printf("Input the points of the questions on a line : \n");//we read the points of the questions
  for (i = 1;i <= N;i++)
   scanf("%d", P + i);
  printf("Input the boundaries a and b : ");
  scanf("%d%d", &a, &b);
  
  if (a > b) { int ffaux = a; a = b; b = ffaux; }
  
  for (long long aux, x = 0;x < (1<<N);x++)
  {
    aux = x;
    i = 1;
    sum = 0;
    while (aux)
    {
      if(aux%2)
        sum += P[i];
      aux /= 2;
      i++;
    }
    
    if (sum >= a && sum <= b)
    {
      aux = x;
      i = 1;
      printf("\nSet of questions : \n");
      printf(" { ");
      while (aux)
      {
        if (aux%2)
         printf("%d ", i);
        aux /= 2;
        i++;
      }
      printf(" } ");
    }
  }
  
  getch();
  return 0;
}
