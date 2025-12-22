;; FISIERUL: termter.cpp
#include "gs.h"
#include <string.h>

set* introdu_simbol_set(char *simb,set *s)
bool is_member(char *simb,set *s)
void tiparire_set(set *s)
void print_set(set *s)

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
