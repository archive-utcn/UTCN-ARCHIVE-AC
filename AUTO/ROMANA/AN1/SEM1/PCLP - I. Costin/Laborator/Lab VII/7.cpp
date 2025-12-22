#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
 
int n;
int x[20], used[20];
//x[i] = at which line is the queen of column i placed
//obviously only one queen for each column!
 
void display()
{
   int i,j;
   for (i=1;i<=n;i++)
      {
         for (j=1;j<=n;j++)
           {
              if (x[j]==i) 
                printf("R ");
              else
                printf("* ");
          }
        printf("\n");
    }
  printf("\n\n");
}
 
int back (int step)
{
  int i,ok,j;
  if (step==n+1) 
    display();
  for (i=1;i<=n;i++)
    if (!used[i]) // if the queens do not attack horizontally
      {
        ok=1;
        for (j=1;j<step;j++) 
         if (i-x[j]==step-j||x[j]-i==step-j) 
         //if the queens do not attack diagonally
           ok=0;
        if (ok)
          {
           x[step]=i;
           used[i]=1;
           back(step+1);
           used[i]=0;
          }
    }
}
 
int main()
{
  printf("Input the dimension of the chess board : ");
  scanf("%d", &n);
  back(1);  
  system("PAUSE");
  getch();
}
