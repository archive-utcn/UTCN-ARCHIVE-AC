
#include "conio.h"
#include "stdio.h"
#include "string.h"

#define alfa "Aapasati o tasta"

main()
{ char sir1[100]="SIR DE CARACTERE";
  char *sir2="SIR de caractere";
  int i,j,k,l;
  i=strcmp(sir1,sir2);
  printf("\ni=%d\n",i);
  j=strncmp(sir1,sir2,3);
  printf("\j=%d\n",j);
  k=stricmp(sir1,sir2);
  printf("\nk=%d\n",k);
  l=strnicmp(sir1,"SIR de 10 caractere",6);   
  printf("\nl=%d\n",l);
  printf("%s\n",alfa);
  getch();
}
