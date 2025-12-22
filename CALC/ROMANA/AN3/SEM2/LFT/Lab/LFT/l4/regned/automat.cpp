#include "gs.h"
#include <string.h>
#include <stdio.h>

void tabel_automat(set *stari,prod *reguli)
{
 for(set *s =stari ; s != NULL ; s = s->urm)
    for( prod *r = reguli; r != NULL ; r=r->urm){
	char c[2];
	strncpy(c,r->car,1);
	c[1]='\0';
	if( !strcmp(c,s->simbol)){
		automat[*c][*(r->car+1)]=
			introdu_simbol_set(r->cdr,automat[*c][*(r->car+1)]);
		}
	}
 }

void print_automat(set *term,set *stari)
{
  set *s,*s1;
  int i;
  printf("     ");
  for(s = term;s != NULL; s = s->urm)
	printf("%s      ",s->simbol);
  putchar('\n');
  for( s=stari; s != NULL ; s = s->urm)
    for (i = 0 ;i<128 ; i++)
	if( i == (int)(*s->simbol) ){
		printf("%c    ",(char)i);
		for(s1 = term; s1 != NULL ; s1=s1->urm)
			if( automat[i][*s1->simbol] != NULL)
				print_set(automat[i][*s1->simbol]);
			else
				printf("0      ");
		putchar('\n');
		break;
		}
}

