#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
 
int n,s;
int x[10];
 
void back(int k)//k represent each step
{
  int i;
  if (s==n)
    {
      printf("{ ");
      for (i=1;i<k;i++)
         printf("%d ",x[i]);
      printf("}\n");
    }
  if (s<n)
    for(i=1;i<=n;i++)
       if(s+i<=n)
         {
          x[k]=i;
          s+=i;
          back(k+1);
          s-=i;
         }
}
 
int main ()
{
  printf("\n Please input the number n \n");//read the number
  scanf("%d",&n);  
  printf("\n The number's partitions are : \n", n);
  back(1);
  getch();
}
   
