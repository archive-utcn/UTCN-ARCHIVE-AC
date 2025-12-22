//FISIERUL: automat.cpp
#include "gs.h"
#include <string.h>
#include <stdio.h>
#include <process.h>

set *automat[128][128];

void tab_aut(set *stari,prod *reguli)
{
 for(set *s =stari ; s != NULL ; s = s->urm)
      for( prod *r = reguli; r != NULL ; r=r->urm){
       char c[2];
       strncpy(c,r->car,1);
       c[1]='\0';
       if( !strcmp(c,s->simbol)){
		    automat[*c][*(r->car+1)]=
		    introdu_simbol_set(r->cdr,automat[*c][*(r->car+1)]);
}     }      }

void print_automat(set *term,set *stari);


void main(int argc, char* argv[])
{  FILE *fpin;
   char *start;
   set *sss, *ss;
   prod *gram, *reguli;
   if(argc>1) {
      if((fpin=fopen(argv[1],"r"))==NULL) {
	 printf("Nu pot deschide fisierul %s ca intrare !\n",argv[1]);
	 exit(1);
      }
      if(argc>2)
	 if(freopen(argv[2],"w",stdout)==NULL) {
	    printf("Nu pot deschide fisierul %s ca iesire !\n",argv[2]);
	    exit(1);
	 }
   }
   else fpin=stdin;
   start=umplestruct(fpin,gram);
   printf("Simbolul de start este %s\n",start);
   tipstruct(gram);
   getchar();
   printf("Starea de start este %s\nRegulile automatului sint:\n",start);
   reguli=determinare_reguli_automat(gram);
   tipstruct(reguli);
   getchar();
   sss=determin_set_neterminale(gram);
   printf("Setul neterminalelor este :\n");
   print_set(sss);
   ss=determin_set_terminale(gram,sss);
   print_set(ss);
   print_set(sss=determinare_stari_automat(sss));
   print_set(determinare_set_stari_finale(gram));
   tab_aut(sss,reguli);
}
