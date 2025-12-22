;; FISIERUL: automat.cpp    
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
}     }     }
void print_automat(set *term,set *stari);
