#include <stdio.h>
#include "lex.h"

char *factor(void);
char *termen(void);
char *expresie(void);

extern char *newname(void);
extern void freename(char *name);

enunturi()
{
  char *temp;
  while(!match(EOI)) {
    temp = expresie();
    if(match(SEMI))
      advance();
    else
      fprintf(stderr,
	      "%d: Inserez ';'\n",
	      yylineno);
    freename(temp);
  }
}

char *expresie()
{
  char *temp, *temp2;
  temp = termen();
  while(match(PLUS)) {
    advance();
    temp2 = termen();
    printf("	%s += %s\n", temp, temp2);
    freename(temp2);
  }
  return temp;
}

char *termen()
{
  char *temp, *temp2;
  temp = factor();
  while(match(TIMES)) {
    advance(); temp2 = factor();
    printf("	%s *= %s\n", temp, temp2);
    freename(temp2);
  }
  return temp;
}

char *factor()
{
  char *temp;
  if(match(NUM_ID)) {
    printf("	%s = %0.*s\n",
	   temp = newname(),
	   yyleng,
	   yytext	);
    advance();
  } else if(match(LP)) {
    advance(); temp = expresie();
    if(match(RP))
      advance();
    else
      fprintf(stderr,
	      "%d: Paranteze neimperecheate\n",
	      yylineno	);
  } else
    fprintf(stderr,
	    "%d: Astept numar sau identificator\n",
	    yylineno	);
  return temp;
}
