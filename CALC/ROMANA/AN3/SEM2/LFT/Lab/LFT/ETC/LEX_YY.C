# line 2 "/etc/yylex.h"
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
#define	YY