#include <conio.h>
#include <stdio.h>
#include <string.h>

char *strinsertn(char *d,int poz,char *s)
{ 
  int i;
  int t=strlen(d)+strlen(s);
  if (s==NULL)
     return d;
  d[t]='\0';
  if (poz<0)
     poz=0;
  if (poz>strlen(d))
     poz=strlen(d);
  for (int i=t-1;i>=poz+strlen(s);i--)
      d[i]=d[i-strlen(s)];
  for (i=0;i<strlen(s);i++)
      d[i+poz]=s[i];
  return d;
}

int main()
{ 
  char sir[100],s[100],s1[100];
  int n;
  printf("\nPlease input a string\n");
  gets(s);
  printf("\n Please input another string\n");
  gets(s1);
  printf("\n Please insert the position on which u want to insert the string\n");
  scanf("%d",&n);
  strcpy(sir,strinsertn(s,n,s1));
  printf("%s",sir);
  getch();
}
