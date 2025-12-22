#include <conio.h>
#include <stdio.h>
#include <string.h>

#define alfa "Press a key"

int main()
{ 
  char sir1[]="Character string";
  char *sir2="Character string";
  int n1,n2,n3;
  n1=strlen(sir1);
  n2=strlen(sir2);
  n3=strlen("Character string");
  printf("\nn1=%d, n2=%d, n3=%d\n",n1,n2,n3);
  printf("%s\n",alfa);
  getch();
}
