#include <conio.h>
#include <stdio.h>
#include <string.h>

char *strdeleten(char *s, int poz, int count)
{ 
  int i=poz,t=strlen(s);
  if ( (count>=t) && (poz<=0) )
     return NULL;
  if (poz>=t)
     return s;
  if (poz<0)
     { poz=0;
       i=poz;
     }
  if ( count>t-poz)
     count=t-poz;
  for (;( (i<=t-count+1) && (i+count<=t) );i++)
      s[i]=s[i+count];
  return s;
}

int main()
{ 
  char sir[100],s[100],s1[100];
  int n,p;
  printf("\n Please input a string\n");
  gets(s);
  printf("\n Please input the position from where to erase and the length\n");
  scanf("%d%d",&n,&p);
  strcpy(sir,strdeleten(s,n,p));
  printf("%s",sir);
  getch();
}
