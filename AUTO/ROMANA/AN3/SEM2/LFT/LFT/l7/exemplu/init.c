#include "evol.h"
#include "ytab.h"
#include <math.h>
extern double Log(), Log10(), Exp(), Sqrt(), integer();
static struct {       /* constante */
	char *nume;
	double cval;
}consts[]= {
	"PI",    3.14159265358979323846,
	"E",     2.71828182845904523536,
	"GAMMA", 0.57721566490153286060,    /* Euler */
	"DEG",   57.29577951308232087680,   /* grad/radian */
	"PHI",   1.61803398874989484820,    /* numarul de aur */
	0,	 0
};
static struct {       /* fuctii predefinite */
	char *nume;
	double (*func)();
}predef[]= {
	"sin",sin,
	"cos",cos,
	"atan",atan,
	"log",Log,         /* isi verifica argumentele */
	"log10",Log10,     /* idem */
	"exp",Exp,         /* idem */
	"sqrt",Sqrt,       /* idem */
	"int",integer,
	"abs",fabs,
	0,0
};

void init()  
/* instaleaza costantele si functiile predefinite in tabela de simboluri */
{
	int i;
	Symbol *s;
	for (i=0;consts[i].nume;i++)
		instal(consts[i].nume,VAR,consts[i].cval);
	for(i=0;predef[i].nume;i++){
		s=instal(predef[i].nume,PREDEF,0.0);
		s->u.ptr=predef[i].func;
		}
}	
