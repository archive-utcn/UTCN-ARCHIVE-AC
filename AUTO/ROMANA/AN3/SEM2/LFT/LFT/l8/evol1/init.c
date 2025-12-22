#include "evol1.h"
#include "ytab.h"
#include <math.h>
extern double Log(), Log10(), Exp(), Sqrt(), integer();
static struct {       /* constante */
	char *nume;
	double cval;
} constante[]= {"PI",    3.14159265358979323846,
		"E",     2.71828182845904523536,
		"GAMMA", 0.57721566490153286060,    /* Euler */
		"DEG",   57.29577951308232087680,   /* grad/radian */
		"PHI",   1.61803398874989484820,    /* numarul de aur */
		0,	 0   };
extern struct Predef predef[];
static struct {  /* cuvinte cheie */
	char *nume;
	int cval;
} cuvcheie[]={	"if",	IF,	"else", ELSE,	"while",WHILE,
		"print",PRINT,	0,	0,	};

void init()
/* instaleaza costantele si functiile predefinite in tabela de simboluri */
{	int i;
	Simbol *s;
	for (i=0;constante[i].nume;i++)
		instal(constante[i].nume,VAR,constante[i].cval);
	for(i=0;predef[i].nume;i++){
		s=instal(predef[i].nume,PREDEF,0.0);
		s->u.ptr=predef[i].func;
	}
	for(i=0;cuvcheie[i].nume;i++)
		instal(cuvcheie[i].nume,cuvcheie[i].cval,0.0);
}
