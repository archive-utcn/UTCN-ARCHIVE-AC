#include <stdio.h>
#include <conio.h>

#define nmax 100
#define maxim 32767

int sir[nmax];

int minim(int x, int y)
{ 
  if (x<=y)
    return x;
  else
    return y;
}

int ter_min(int dim_sir)
{ 
   if (dim_sir>=0) 
      return minim(sir[dim_sir],ter_min(dim_sir-1));
   else
      return maxim;
}


int main()
{ 
  int n,i=0;
  printf("\nPlease input the numbers of elements \n");
  scanf("%d",&n);
  printf("\nPlease input the elements of the string\n");
  for (i=0;i<n;++i)
      { 
         printf("\n Please input the element of the string sir[%d] \n",i+1);
         scanf("%d",&sir[i]);
      }
  printf("\nThe introducted string is \n");
  for (i=0;i<n;++i)
      { 
        printf("%6d",sir[i]);
        if ((i+1)%10==0)
           printf("\n");
      }
  printf("\nThe smaller number from the string is %d\n", ter_min(n-1));
  getch();
}



