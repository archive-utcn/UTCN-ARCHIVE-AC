#include "gs.h"
#include <string.h>

char* strrev(char* s) {
  char aux;
  int n=strlen(s);
  for(int i=0; i<n/2; i++) {
    aux=s[i];
    s[i]=s[n-i-1];
    s[n-i-1]=aux;
  }
  return s;
}

set* introdu_simbol_set(char *simb,set *s)
{
 for(set *sc=s; sc != NULL && strcmp(sc->simbol,simb);sc=sc->urm);
 if(sc == NULL){
	set *nou = new set;
	nou->simbol = makesir(simb);
	nou->urm = s;
	return nou;
	}
 else return s;
 }

bool is_member(char *simb,set *s)
{
 for(set *sc=s; sc != NULL && strcmp(sc->simbol,simb);sc=sc->urm);
 if(sc == NULL)
	return False;
 else
	return True;
 }

void tiparire_set(set *s)
{
  for ( ;s != NULL;s=s->urm)
	printf("%s , ",s->simbol);
  printf("\n");
}


set* determin_set_neterminale(prod *p)
{ set *neterm = NULL;
  for(prod *q = p; q != NULL ; q = q->urm)
	      neterm = introdu_simbol_set(q->car,neterm);
  return neterm;
}

set * determin_set_terminale(prod *p,set *neterm)
{ set *term = NULL;
  for(prod *q = p;q != NULL ; q = q->urm)
	for(char *c = q->cdr; *c != '\0' ; c++){
			char termin[2];
			strncpy(termin,c,1);
			termin[1]='\0';
			if(! is_member(termin,neterm))
				term = introdu_simbol_set(termin,term);
			}
  return term;
}

