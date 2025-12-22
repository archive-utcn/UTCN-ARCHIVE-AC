/*
 * Copyright 1988 Mortice Kern Systems Inc.
 * All rights reserved.
 */
#include <stdio.h>
/* include string.h to get definition of memmove()
 * If you do not have string.h or it does not contain memmove,
 * you will have to declare memmove here
 */
#include <string.h>
/*
 * If you have a typedef for size_t in your source or headers,
 * compile your scanner with _SIZE_T=1 to prevent multiple type definitions
 * Turbo C defines size_t in stdio.h, and in lots of other places.
 */
#ifndef _SIZE_T
typedef int	size_t;
#define _SIZE_T 1
#endif

#if __STDC__
#define	YY_ARGS(_args_)	_args_
#else
#define	YY_ARGS(_args_)	()
#endif

#define	YY_FATAL(msg)	{ fprintf(stderr, "yylex: %s\n", msg); exit(1); }

#define	YY_INTERACTIVE	1	/* save micro-seconds if 0 */

extern FILE	*yyin;		/* scanner input file */
extern FILE	*yyout;		/* scanner output file */

#define	YYLMAX 100		/* token and pushback buffer size */

#define	YY_RETURN	0
#define	YY_SKIP		1
#define	YY_REJECT	2
#define	YY_MORE		3

#define	yytext	yy_tbuf		/* token string */

#define	ECHO		fputs(yytext, yyout)
#define	BEGIN		yy_start =
#define	REJECT		(yy_actype = YY_REJECT)
#define	NLSTATE		(yy_lastc = YYNEWLINE)
#define	YY_INIT		(yy_start = 0, yyleng = yy_end = 0, yy_lastc = YYNEWLINE)

/* user-callable macros */
#define	yymore()	(yy_actype = YY_MORE)
#define	yygetc()	getc(yyin) 	/* yylex input source */
#define	output(c)	putc((c), yyout) /* yylex sink for unmatched chars */

/* functions defined in yylex.c */
void	yyless	YY_ARGS((int n));
int	input	YY_ARGS((void));
int	unput	YY_ARGS((int c));

/* functions defined in libl.lib */
int	yywrap	YY_ARGS((void));
void	yyerror	YY_ARGS((char *fmt, ...));
void	yycomment	YY_ARGS((char *term));
int	yymapch	YY_ARGS((int delim, int escape));

extern	int	yy_actype;
extern	int	yylineno, yyleng;
extern	int	yy_start, yy_lastc;
extern	unsigned char yy_tbuf [];

