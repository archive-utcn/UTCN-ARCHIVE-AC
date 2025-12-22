/*
 * Copyright 1988 Mortice Kern Systems Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include "yylex.h"

/*
 * yymapch -- handle escapes within strings
 */

int
yymapch(delim, esc)
	int delim, esc;
{
	register int c, octv, n;

	if ((c = input()) == delim)
		return (EOF);
	if (c<=0 || c=='\n') {
		yyerror("unterminated string");
		unput(c);
		return (EOF);
	}
	if (c != esc)
		return (c);
	switch (c = input()) {
	case 't':
		return ('\t');
	case 'n':
		return ('\n');
	case 'f':
		return ('\f');
	case '\"': case '\'':
		return (c);
	case 'e':
		return ('\e');
	case 'r':
		return ('\r');
	case '0': case '1': case '2': case '3':
	case '4': case '5': case '6': case '7':
		octv = c-'0';
		for (n = 1; (c = input())>='0' && c<='7' && n<=3; n++)
			octv = octv*010 + (c-'0');
		unput(c);
		return (octv);
	case '\n':
		return  yymapch(delim, esc);
	}
	return (c);
}
