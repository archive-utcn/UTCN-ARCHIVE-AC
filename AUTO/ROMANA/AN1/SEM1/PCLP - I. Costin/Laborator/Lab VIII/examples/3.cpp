#include <conio.h>
#include <stdio.h>
#include <string.h>

#define alfa "Press a key"

main()
{ char sir1[100]="Character string1";
  char *sir2="Character string2";
  char sir3[100];
  strcpy(sir3,sir1);
  strcat(sir1,sir2);
  printf("\nsir1=%s\n",sir1);
  strncat(sir3,sir2,5);
  for (int i=0;i<=strlen(sir3);++i)
      printf("%X ",sir3[i]);
  printf("\nsir3=%s\n",sir3);
  printf("%s\n",alfa);
  getch();
}
