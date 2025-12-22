#include <conio.h>
#include <stdio.h>
#include <string.h>
#include <malloc.h>

char *strcopyn(char *s,int poz,int count)
{ 
  char *aux=(char*) malloc((strlen(s)+1)*sizeof(char));
  int i=poz,k=0;
  if (poz<0)
     { 
       i=0;
       poz=0;
     }
  if (poz>=strlen(s))
     return NULL;
  for (;((i<poz+count) && (i<strlen(s)));i++)
      aux[k++]=s[i];
  aux[k]='\0';
  return aux;
}

int main()
{ 
  char sir[100]="j",s[100];
  int n,p;
  printf("\n Please input  a string \n");
  gets(s);
  printf("\n Please input the position from where you want to copy,and the number of characters \n");
  scanf("%d%d",&n,&p);
  strcpy(sir,strcopyn(s,n,p));
  printf("%s",sir);
  getch();
}
