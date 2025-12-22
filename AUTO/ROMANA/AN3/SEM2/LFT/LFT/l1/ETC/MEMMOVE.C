/*
 * Copyright 1988 Mortice Kern Systems Inc.
 * All rights reserved.
 */
#include "yylex.h"

#if ! __STDC__

#define	_Void	char
#define	_Const	

_Void *
memmove(dap, sap, n)
	_Void *dap;
	_Const _Void *sap;
	register size_t n;
{
	register char *dp = dap, *sp = sap;

	if (n <= 0)
		;
	else if (dp < sp)
		do *dp++ = *sp++; while (--n > 0);
	else if (dp > sp) {
		dp += n;
		sp += n;
		do *--dp = *--sp; while (--n > 0);
	}
	return dap;
}

#endif
