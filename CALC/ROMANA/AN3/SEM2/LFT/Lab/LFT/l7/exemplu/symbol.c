#include "evol.h"
#include "ytab.h"

static Symbol *symlist=0; /* tabela de simboluri e o lista */

Symbol *caut(s)     /* cauta in tabela de simboluri */
	char *s;
{
	Symbol *sp;

	for(sp=symlist;sp!=(Symbol *) 0;sp=sp->urm)
		if(strcmp(sp->nume,s)==0)  return sp;
	return (Symbol *) 0;  /* nu l-a gasit */
}

Symbol *instal(s,t,d)       /* instaleaza pe s in tabela de simboluri */
	char *s;
	int t;
	double d;
{
	Symbol *sp;
	char *emalloc();
	
	sp=(Symbol *) emalloc(sizeof(Symbol));
	sp->nume=emalloc(strlen(s)+1);   /* +1 ptr. '\0' */
	strcpy(sp->nume,s);
	sp->tip=t;
	sp->u.val=d;
	sp->urm=symlist;  /* inserare in capul listei */
	symlist=sp;
	return sp;
}

char *emalloc(n)            /* verifica revenirea din malloc */
	unsigned n;
{
	char *p, *malloc();
	
	p=malloc(n);
	if(p==0)
		execerror("Depasire de memorie",(char *) 0);
	return p;
}
