#include "stdio.h"
#include "conio.h"

int display(int n)
{ 
  char s[25];
  if (n>0)
     { 
       printf("\n Please input the word \n");//read the words
       scanf("%s",s);
       display(n-1);
       printf("%s  ",s);
     }
}

int main()
{ 
  int n;
  printf("\n How many words we have ?\n");
  scanf("%d",&n);
  display(n);
  getch();
}
