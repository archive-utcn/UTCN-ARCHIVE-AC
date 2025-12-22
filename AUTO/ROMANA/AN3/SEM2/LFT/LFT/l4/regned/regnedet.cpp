#include "gs.h"
#include <string.h>

char *determinare_stare_start(char *s)
{
 return s;
}

set *determinare_set_terminale_automat(set *term)
{
 return term;
}

set *determinare_stari_automat(set *neterm)
{
 return introdu_simbol_set("f",neterm);
}

prod *determinare_reguli_automat(prod *productii)
{
 prod *reguli,*pr,*q;
 reguli=pr= new prod;
 while( productii != NULL){
	if( strlen(productii->cdr) == 1){  //   X -> t cu X=nonterminal
					   //             t=terminal
	  if(strcmp(productii->cdr,"$")){   // productia nu e vida
		char sir[5];
		strcpy(sir,productii->car);
		strcat(sir,productii->cdr);
		pr->car = makesir(sir);
		strcpy(sir,"f");
		pr->cdr = makesir(sir);
		pr->urm = new prod;
		q = pr;
		pr = pr->urm;
		}
	  }
	else{				   // X -> tY cu X,Y = nonterminal
					   //             t = terminal
		char sir[5];
		strcpy(sir,productii->car);
		strncat(sir,productii->cdr,1);
		pr->car = makesir(sir);
		pr->cdr = makesir(productii->cdr+1);
		pr->urm = new prod;
		q = pr;
		pr = pr->urm;
		}
   productii = productii -> urm;
   }
  q->urm = NULL;
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