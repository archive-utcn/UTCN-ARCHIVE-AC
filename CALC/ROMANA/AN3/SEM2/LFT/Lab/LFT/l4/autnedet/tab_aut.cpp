
//FISIERUL: automat.cpp    
#include "gs.h"
#include <string.h>
#include <stdio.h>

set *automat[128][128];

void tab_aut(set *stari,prod *reguli)
{
 for(set *s =stari ; s != 0 ; s = s->urm)
      for( prod *r = reguli; r != 0 ; r=r->urm){
       char c[2];
       strncpy(c,r->car,1);
       c[1]='\0';
       if( !strcmp(c,s->simbol)){
		    automat[*c][*(r->car+1)]=
		    introdu_simbol_set(r->cdr,automat[*c][*(r->car+1)]);
}     }      }

void print_aut(set *term,set *stari)
{  printf("     ");
   set *sa;
   set *t;
   for(t=term; t!=0; t=t->urm) printf("\t%s",t->simbol);
   putchar('\n');
   for(set *s=stari; s!=0; s=s->urm) {
      printf("%s",s->simbol);
      for(t=term; t!=0; t=t->urm) {
	 if((sa=automat[*(s->simbol)][*(t->simbol)]) != 0) {
	    putchar('\t');
	    print_set(sa);
	 }
	 else printf("\t   ");
      }
      putchar('\n');
   }
   return;
}
