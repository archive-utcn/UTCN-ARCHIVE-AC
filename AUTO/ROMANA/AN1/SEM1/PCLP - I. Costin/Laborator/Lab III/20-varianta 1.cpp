#include <stdio.h>
#include <string.h>
#include <conio.h>

char s[200];
int lmax;
char mcuv[20];

int main ()
{
  printf("Input the sequence of words on one line :\n");//we read the phrase in a string
  gets(s);
  
  char *cuv;
  cuv = strtok (s, ";!?,. ");  
  int nrv = 1;
  
  lmax = strlen(cuv);
  for (int i = 0;i <= strlen(cuv);i++)
   mcuv[i] = cuv[i];
  
  while (cuv)
  {
    if (strlen(cuv) > lmax)
    {
      for (int i = 0;i <= strlen(cuv);i++)
       mcuv[i] = cuv[i];
      lmax = strlen(cuv);
    }
    
    nrv++;
    cuv = strtok (NULL, ";!?,. ");
  }
  
  printf("Longest word %s with length %d", mcuv, lmax);//we display the longest word
  getch ();
  return 0;
}
