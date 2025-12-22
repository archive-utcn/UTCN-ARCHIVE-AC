#include <stdio.h>
#include "lex.h"

void factor(char *temp);
void termen(char *temp);
void expresie(char *temp);

extern char *newname(void);
extern void freename(char *name);

enunturi()
{
  char *temp;
  while(!match(EOI)) {
    expresie(temp = newname()); freename(temp);
    if(match(SEMI))
      advance();
    else
      fprintf(stderr,
	      "%d: Inserez ';'\n",
	      yylineno	);
  }
}

void expresie(temp) char *temp;
{
  char *temp2;
  termen(temp);
  while(match(PLUS)) {
    advance(); termen(temp2 = newname());
    printf("	%s += %s\n", temp, temp2);
    freename(temp2);
  }
}

void termen(temp) char *temp;
{
  char *temp2;
  factor(temp);
  while(match(TIMES)) {
    advance(); factor(temp2 = newname());
    printf("	%s *= %s\n", temp, temp2);
    freename(temp2);
  }
}

void factor(temp) char *temp;
{
  if(match(NUM_ID)) {
    printf("	%s = %0.*s\n", temp, yyleng, yytext);
    advance();
  } else if(match(LP)) {
    advance(); expresie(temp);
    if(match(RP))
      advance();
    else
      fprintf(stderr,
	      "%d: Paranteze neimperecheate\n",
	      yylineno	);
  } else
    fprintf(stderr,
	    "%d: Asteptat nume sau identificator\n",
	    yylineno	);
}
