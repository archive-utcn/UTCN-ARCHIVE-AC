#include <stdio.h>
#include <stdlib.h>
#include<conio.h>
#include<string.h>

int main()
{ char s[100],d[100],a[100];
int poz,k=0,i;
gets(s);
gets(d);
scanf("%d",&poz);
strncpy(a,d+poz,strlen(d)-poz);
a[strlen(d)-poz]='\0';
puts(a);
strcpy(d+poz,s);
strcat(d,a);
puts(d);

getch();
return 0;}
