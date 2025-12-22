#include "stiva.h"

int stiva (char s)
{
  char str [20];
  int i;

  sscanf (s,"%s %*s %d",str,&i);
  printf ("%s -> %d\n",str,i);

  return 0;
}
