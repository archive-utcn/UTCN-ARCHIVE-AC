//inserarea unui sir de caractere într-un alt sir de la pozitia specificata
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int inserare(char *a,char *b,char *c)
{
	int poz;
	a=(char *)calloc(50,sizeof(char));
	b=(char *)calloc(50,sizeof(char));
	printf("primul sir este: ");
	gets(a);
	printf("al doilea sir este: ");
	gets(b);
	printf("pozitia pe care va fi inserat sirul B in sirul A: ");
	scanf("%d",&poz);
	a=(char *)realloc(a,poz+strlen(a));
	c=(char *)calloc(20,sizeof(char));
	strcpy(c,a+poz);
	strcpy(a+poz,b);
	strcat(a,c);
	printf("\n\nAsirul A in care a fost inserat sirul B pe pozitia specificata: \n");
	puts(a);
}
int main ()
{
	int **v,**w,**y;
	inserare(*v,*w,*y);
	return 0;
}
