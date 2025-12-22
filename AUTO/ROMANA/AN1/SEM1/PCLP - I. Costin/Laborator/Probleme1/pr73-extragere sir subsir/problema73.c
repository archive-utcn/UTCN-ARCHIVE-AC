#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<conio.h>

int main()
{char s[100];
int poz,nr;
gets(s);
scanf("%d %d",&poz,&nr);
strncpy(s,s+poz,nr);
s[nr]='\0';
 printf("%s",s);
    getch();
    return 0;}
