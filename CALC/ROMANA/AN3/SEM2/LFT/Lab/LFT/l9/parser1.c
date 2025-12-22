#include <stdio.h>
#include "lex.h"

void factor(void);
void termen(void);
void expresie(void);

enunturi()
{
  while(!match (EOI)) {
    expresie();
    if(match(SEMI))
      advance();
    else
      fprintf(stderr,
	      "%d: Inserez ';' \n",
	      yylineno	);
  }
}

void expresie()
{
  if(!la_legal(NUM_ID,LP,0))
    return;
  termen();
  while(match(PLUS)) {
    advance(); termen();
  }
}

void termen()
{
  if(!la_legal(NUM_ID,LP,0))
    return;
  factor();
  while(match(TIMES)) {
    advance(); factor();
  }
}

void factor()
{
  if(!la_legal(NUM_ID,LP,0))
    return;
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
	    "%d: Asteaptat numar sau identificator\n",
	    yylineno	);
}

#include <stdarg.h>

#define	MAXFIRST	16
#define	SYNCH	SEMI

int la_legal(first_arg) int first_arg;
{
  va_list args;
  int tok;
  int lookaheads[MAXFIRST],
      *p = lookaheads,
      *current;
  int error_printed = 0;
  int rval = 0;
  va_start(args, first_arg);
  if(!first_arg) {
    if(match(EOI))
      rval = 1;
  } else {
    *p++ = first_arg;
    while((tok = va_arg(args, int)) &&
	  p < &lookaheads[MAXFIRST]	)
      *++p = tok;
    while(!match (SYNCH)) {
      for(current = lookaheads;
	  current < p;
	  ++current)
	if(match(*current)) {
	  rval = 1; goto exit;
	}
      if(!error_printed) {
	fprintf(stderr,
		"%d: Syntax error\n",
		yylineno	);
	error_printed = 1;
      }
      advance();
    }
  }
 exit:
  va_end(args);
  return rval;
}
