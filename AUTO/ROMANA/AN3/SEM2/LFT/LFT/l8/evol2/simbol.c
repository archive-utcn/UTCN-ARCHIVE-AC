#include <stdio.h>
#include "evol2.h"
#include "ytab.h"

Simbol *simblist=0; /* tabela de simboluri e o lista */

Simbol *caut(s)     /* cauta in tabela de simboluri */
	char *s;
{	Simbol *sp;
	for(sp=simblist;sp!=(Simbol *) 0;sp=sp->urm)
		if(strcmp(sp->nume,s)==0)  return sp;
	return (Simbol *) 0;  /* nu l-a gasit */
}

Simbol *cautstr(s)    /* cauta un STRING in tabela de simboluri */
	char *s;
{	Simbol *sp;
	for(sp=simblist;sp!=(Simbol *) 0;sp=sp->urm)
		if((sp->tip==STRING) && (strcmp(sp->u.str,s)==0)) return sp;
	return (Simbol *) 0;
}

Simbol *instal(s,t,d)       /* instaleaza pe s in tabela de simboluri */
	char *s;  int t;  double d;
{	Simbol *sp;
	char *emalloc();
	sp=(Simbol *) emalloc(sizeof(Simbol));
	sp->nume=emalloc(strlen(s)+1);   /* +1 ptr. '\0' */
	strcpy(sp->nume,s);
	sp->tip=t;      sp->u.val=d;
	sp->urm=simblist;  /* inserare in capul listei */
	simblist=sp;
	return sp;
}

Simbol *inststr(s)        /* instaleaza un STRING in tabela de simboluri */
	char *s;
{	Simbol *sp;
	char *emalloc();
	sp=(Simbol *) emalloc(sizeof(Simbol));
	sp->tip=STRING;
	sp->u.str=emalloc(strlen(s)+1);
	strcpy(sp->u.str,s);
	sp->urm=simblist;
	simblist=sp;
	return sp;
}

char *emalloc(n)            /* verifica revenirea din malloc */
	unsigned n;
{	char *p, *malloc();
	p=malloc(n);
	if(p==0) execerror("Depasire de memorie",(char *) 0);
	return p;
}