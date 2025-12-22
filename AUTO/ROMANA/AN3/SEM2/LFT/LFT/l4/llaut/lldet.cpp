#include "gs.h"
#include <string.h>


char *determinare_simbol_stiva_start(char *s)
{
 return s;
}

char *determinare_stare_initiala_automat(void)
{
 return makesir("q");
}

char *determinare_set_stari_finale(void)
{
 return makesir("q");
}

char *determinare_stari_automat(void)
{
 return makesir("q");
}

set *determinare_set_terminale_automat(set *term)
{
 return term;
}


prod *determinare_reguli_automat(prod *productii,set *term)
{
 prod *reguli,*pr,*q;
 reguli=pr= new prod;
 while( productii != NULL){
		char sir[5];
		strcpy(sir,productii->car);
		strcat(sir,"q");
		pr->car = makesir(sir);
		strcpy(sir,strrev(productii->cdr));
		strcat(sir,"q");
		pr->cdr = makesir(sir);
		pr->urm = new prod;
		pr = pr->urm;
		productii = productii->urm;
		}
  while( term != NULL){
		char sir[5];
		strcpy(sir,term->simbol);
		strcat(sir,"q");
		strcat(sir,term->simbol);
		pr->car=makesir(sir);
		pr->cdr = makesir("q");
		pr->urm = new prod;
		q = pr;
		pr = pr->urm;
		term = term->urm;
		}
  q->urm = NULL;
  return reguli;
  }

set *determinare_set_simboluri_stiva_automat(set *term,set *neterm)
{ set *s = NULL;
  for( ; term != NULL ; term = term->urm)
		s = introdu_simbol_set(term->simbol,s);
  for( ; neterm != NULL ; neterm = neterm->urm)
		s = introdu_simbol_set(neterm->simbol,s);
  return s;
}