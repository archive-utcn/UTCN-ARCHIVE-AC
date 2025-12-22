/*
 * Copyright 1988 Mortice Kern Systems Inc.
 * All rights reserved.
 */
/*
 * default yyerror for YACC and LEX
 */

#include <stdio.h>
#if __STDC__
#include <stdarg.h>
#else
#include <varargs.h>
#endif
#include "yylex.h"

void
#if __STDC__
yyerror(char *fmt, ...)
#else
yyerror(va_alist) va_dcl
#endif
{
	va_list va;
#if !__STDC__
	char *fmt;
#endif

#if __STDC__
	va_start(va, fmt);
#else
	va_start(va);
	fmt = va_arg(va, char *);
#endif
	if (yylineno)
		fprintf(stderr, "%d: ", yylineno);
	vfprintf(stderr, fmt, va);
	fprintf(stderr, "\n");
	va_end(va);
}
