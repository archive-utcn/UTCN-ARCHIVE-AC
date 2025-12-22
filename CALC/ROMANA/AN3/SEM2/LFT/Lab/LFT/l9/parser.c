#include <stdio.h>
#include "lex.h"

enunturi()
{
  expresie();
  if(match(SEMI))
    advance();
  else
    fprintf(stderr, "%d: Inserez ';'\n", yylineno);
  if(!match(EOI))
    enunturi();
}

expresie()
{
  termen(); expr_prim();
}

expr_prim()
{
  if(match(PLUS)) {
    advance(); termen(); expr_prim();
  }
}

termen()
{
  factor(); term_prim();
}

term_prim()
{
  if(match(TIMES)) {
    advance(); factor(); term_prim();
  }
}

factor()
{
  if(match(NUM_ID))
    advance();
  else if(match(LP)) {
    advance(); expresie();
    if(match(RP))
      advance();
    else
      fprintf(stderr,
	      "%d: Paranteze neimperecheate\n",
	      yylineno	);
  } else
    fprintf(stderr,
	    "%d: Asteptat numar sau identificator\n",
	    yylineno	);
}
