/ª                 EVOL²       LEX.CPÐ           */
#include <stdio.h>
#include <ctype.h>
#include "evol.h"

extern tiplexem vlexem;
extern int lexem,lexurm, linie;

int lex(void)
{  int c;
   if(lexurm > 0){
	lexem = lexurm;
	lexurm = 0;
	return lexem;
	}
   while((c=getchar()) == ' ' || c == '\t');
   if ( c == EOF )
	return lexem=0;
   if(c == '.' || isdigit(c)){
	ungetc(c,stdin);
	scanf("%lf", &vlexem.val);
	return lexem=NUMAR;
	}
   if (isalpha(c)){
	Simbol *s;
	char tamp[100], *p = tamp;
	do
		*p++ = c;
	while( ( c = getchar()) != EOF && isalnum(c) && (!isspace(c)));
	ungetc(c,stdin);
	*p = '\0';
	if ( ! (s = caut(tamp))){
		s = install(tamp,NEDEF,0.0);
		vlexem.sim=s;
		return lexem= (s->tip= NEDEF ? VAR : s->tip);
		}
	else {
		vlexem.sim = s;
		return lexem = s->tip;
		}
	}
     switch(c){
	case '+' : lexem = PLUS; break;
	case '-' : lexem = MINUS; break;
	case '*' : lexem = STEA; break;
	case '/' : lexem = SLASH; break;
	case '(' : lexem = PARS ; break;
	case ')' : lexem = PARD; break;
	case '=' : lexem = ATRIB ; break;
	case '^' : lexem = SAG; break;
	case '\n' : lexem = NL; linie++; break;
	default : lexem = 0;
	}
	return lexem;
   }