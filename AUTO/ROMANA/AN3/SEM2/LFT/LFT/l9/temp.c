#include <stdio.h>
#include "lex.h"

char *Names[] = { "t0", "t1", "t2", "t3",
		  "t4", "t5", "t6", "t7" };
char *Namep = Names;

char *newname()
{
  if(Namep >= &Names[sizeof(Names)/sizeof(*Names)]) {
    fprintf(stderr,
	    "%d: Expresie prea complicata\n",
	    yylineno	);
    exit(1);
  }
  return(*Namep++);
}

freename(s) char *s;
{
  if(Namep > Names)
    *--Namep = s;
  else
    fprintf(stderr,
	    "%d: Stack underflow\n",
	    yylineno	);
}
