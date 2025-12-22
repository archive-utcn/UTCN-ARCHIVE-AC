#include "stdio.h"
#include "conio.h"

int a[100],x[100],k,n,s=0;

void result(int n)
{ 
  int i;
  s++;
  printf("\n The solution of the number %d is\n",s);
  for (i=0;i<=n;i++)
      printf("%d ",a[x[i]]);
  printf("\n");
}

int correct(int k)
{ 
  int i;
  for (i=0;i<k;i++)
      if (x[k]==x[i])
         return 0;
  if (x[k]<x[k-1])
     return 0;
  return 1;
}

void combination(int t)
{ 
  int i=0;
  for (;i<n;i++)
      { 
        x[t]=i;
        if (correct(t))
           if (t==k-1)
              result(t);
           else
              combination(t+1);
      }
}

int main()
{ 
  int i=0;
  printf("\n Please input the numbers of elements \n");
  scanf("%d",&n);
  printf("\nPlease input the elements\n");
  for (;i<n;i++)
      scanf("%d",&a[i]);
  printf("\n Input k=\n");
  scanf("%d",&k);
  printf("\nThe result\n");
  combination(0);
  getch();
}
