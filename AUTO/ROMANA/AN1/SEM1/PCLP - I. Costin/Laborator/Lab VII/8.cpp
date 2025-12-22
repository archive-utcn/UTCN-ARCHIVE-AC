#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
 
int n,a[20],x[20],u[20];
int s;
 
void display()//display the permutation
{
  int i;
  printf("#%d  { ", ++s);
  for (i=1;i<=n;i++)
     printf("%d ", a[x[i]]);
  printf("}\n");
} 
 
void generate_per(int k)//generate the permutation
{
  int i;
  if (k==n+1)//k represent each step
      display();     
  else
    {
      for (i=1;i<=n;i++)
        if (!u[i])
           {
             x[k]=i;
             u[i]=1;
             generate_per(k+1);
             u[i]=0;
          }
   }
}
 
int main ()
{
  int i;
  printf("\n Please input the size of the set : \n");
  scanf("%d" , &n);
  printf("\n Please input the set : \n");
  for (i=1;i<=n;i++)
    scanf("%d", &a[i]);  
  generate_per(1);  
  system("PAUSE");
  getch();
}
