#include <stdio.h>
#include <conio.h>

void revers(void)
{ 
  char c;
  scanf("%c",&c);
  if (c!='\40')
     { 
       printf("%c",c);
       revers();
     }
  printf("%c",c);
}

int main()
{ 
  int n,i=1;
  printf("\nPlease input the numbers of words \n");
  scanf("%d",&n);
  for (i=1;i<=n;++i)
      { 
        revers();
        printf("\n");
      }
  printf("\n The program is over\n");
  getch();
}



