//FISIERUL: termter.cpp
#include "gs.h"
#include <string.h>

int is_member(char *simb,set *s)
{  set *ss=s;
   while((ss!=NULL)&&(strcmp(simb,ss->simbol))) ss=ss->urm;
   if(ss!=NULL) return 1;
   else return 0;
}

set* introdu_simbol_set(char *simb,set *s)
{  set *ss=s;
   if(!is_member(simb,ss)) {
      ss=new set;
      ss->simbol=makesir(simb);
      ss->urm=s;
      s=ss;
      //print_set(ss);
   }
   return s;
}

void print_set(set *s)
{  printf("{ ");
   while(s!=NULL) {
      printf("%s,",s->simbol);
      s=s->urm;
   }
   printf("}");
   return;
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
