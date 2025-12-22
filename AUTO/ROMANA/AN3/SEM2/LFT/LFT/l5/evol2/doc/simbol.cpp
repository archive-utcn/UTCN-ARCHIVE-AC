/*		EVOL2  SIMBOL.CPÐ              */

// contine functiile de acces la tabela de simboluri

#include "evol.h"
#include <string.h>
#include <alloc.h>

static Simbol *lstsimb = NULL;

Simbol *caut(char *s)
{  Simbol *ps;
   for(ps = lstsimb; ps != NULL ; ps = ps->urm)
	if( !strcmp(ps->nume,s))
		return ps;
   return NULL;
}

Simbol *install(char *s, int t, double d)
{  Simbol *ps;
   ps = new Simbol;
   strcpy(ps->nume =(char *)alloc(strlen(s)+1),s);
   ps->tip = t;   ps->u.val = d;   ps->urm = lstsimb;
   return lstsimb=ps;
}

void * alloc(unsigned n)
{ void *p;
  if (p = malloc(n))
	return p;
  erexec("Depasire memorie",(char *)0);
}

