#include <stdio.h>
#include <conio.h>

void hanoi(int n,int a,int b,int c)
{
   if (n==1)
      {
	    printf("%c->%c ",a,b);
      }
   else
      {
	    hanoi(n-1,a,c,b);
	    printf("%c->%c ",a,b);
	    hanoi(n-1,c,b,a);
      }
}

int main()
{
  int i;
  printf("\nPlease input the numbers of the disks \n");
  scanf("%d",&i);
  hanoi(i,'a','c','b');
  getch();
}
