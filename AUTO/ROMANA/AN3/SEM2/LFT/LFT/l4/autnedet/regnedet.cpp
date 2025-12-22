//FISIERUL: regnedet.cpp
#include "gs.h"
#include <string.h>

char *determinare_stare_start(char *s)
{ return s;}

set *determinare_set_terminale_automat(set *term)
{ return term;}

set *determinare_stari_automat(set *neterm)
{ return introdu_simbol_set("f",neterm);}

prod *determinare_reguli_automat(prod *productii)
{
 char sir[5];
 char *ppcc;
 prod *reguli,*pr,*q;
 reguli=pr= new prod;
 while( productii != NULL){
     if( strlen(productii->cdr) == 1){
			      //   X -> t cu X=nonterminal
			      //  t=terminal
	if(strcmp(productii->cdr,"$")){
		     // productia nu e vida
		    strcpy(sir,productii->car);
		    ppcc=sir;
		    strcat(ppcc,productii->cdr);
		    pr->car = makesir(ppcc);
		    // strcpy(sir,"f");
		    sir[0]='f';
		    sir[1]='\0';
		    pr->cdr = makesir(sir);
		    pr->urm = new prod; q = pr; pr = pr->urm;
	}
     }
     else {   // X -> tY cu X,Y = nonterminal
	     // t = terminal
       ppcc=productii->cdr;
       strcpy(sir,productii->car);
       sir[1]=*ppcc;
       sir[2]='\0';
       // strncat(ppcc,productii->cdr,1);
       pr->car = makesir(sir);
       //strcpy(sir,productii->cdr);
       ppcc=productii->cdr;
       ppcc++;
       sir[0]=*ppcc;  sir[1]='\0';
       // strncat(ppcc,productii->cdr,2);
       // sir[0]=sir[1];
       // sir[1]='\0';
       pr->cdr=makesir(sir);
       //pr->cdr = makesir(productii->cdr+1);
       pr->urm = new prod;  q = pr;  pr = pr->urm;
       //printf("\nX->tY   pr=%d si %s -> %s",pr,pr->car,pr->cdr);
       }
   productii = productii -> urm;
   }
  q->urm = NULL;
  delete pr;
  return reguli;
  }

set *determinare_set_stari_finale(prod *productii)
{ set *s = NULL;
  s = introdu_simbol_set("f",s);
  for( ; productii != NULL ; productii = productii->urm)
       if(!strcmp(productii->cdr,"$"))
              s = introdu_simbol_set(productii->car,s);
  return s;
 }
