/ª                EVOL²          INIT.CPÐ              */

//			*****  INIT.CPP  ******

//  functiile pentru initializarea tabelei de simboluri

#include "evol.h"
#include <math.h>

static struct{
	char *nume;
	double valc;
	}cons[] = {
		{"PI", 3.14159265358979323846},
		{"E" , 2.71828182845904523536},
		{"GAMMA", 0.57721566490153286060},
		{"DEG" , 57.2957795130823208768},
		{"PHI" , 1.61803398874989484820},
		{(char *)0, 0}};

static struct{
	char *nume;
	double (*func)(double);
	} predef[] = {
		{"sin" , sin },
		{"cos" , cos },
		{"atan" , atan},
		{"log", log},
		{"log10", log10},
		{"exp" , exp},
		{"sqrt" , sqrt},
		{"abs" , fabs},
		{(char *)0, 0}};

void init(void)
{ int i;
  Simbol *s;
  for(i=0; cons[i].nume ; i++)
	install(cons[i].nume, VAR , cons[i].valc);
  for(i=0; predef[i].nume; i++){
	s = install(predef[i].nume, PREDEF, 0.0);
	s->u.ptr = predef[i].func;
	}
}


