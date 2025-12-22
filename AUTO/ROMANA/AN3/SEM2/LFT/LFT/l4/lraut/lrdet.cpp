#include "gs.h"
#include <string.h>


char *determinare_simbol_stiva_start()
{
 return makesir("");
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


prod *determinare_reguli_automat(prod *productii,set *term,char *start)
{
 prod *reguli,*pr,*q;
 reguli=pr= new prod;

 // Adaugare regula Zq -> q

 char sir[10];
 strcpy(sir,start);
 strcat(sir,"q");
 pr->car = makesir(sir);
 pr->cdr = makesir("q");
 pr->urm = new prod;
 pr = pr->urm;

 // Adaugare reguli X1...Xnq -> Xq  daca    X -> X1...Xn apartine gramaticii

 while( productii != NULL){
		strcpy(sir,productii->cdr);
		strcat(sir,"q");
		pr->car = makesir(sir);
		strcpy(sir,productii->car);
		strcat(sir,"q");
		pr->cdr = makesir(sir);
		pr->urm = new prod;
		pr = pr->urm;
		productii = productii->urm;
		}

 // Adaugare productii qt -> tq daca t e simbol terminal

  while( term != NULL){
		strcpy(sir,"q");
		strcat(sir,term->simbol);
		pr->car=makesir(sir);
		pr->cdr = makesir(strrev(sir));
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