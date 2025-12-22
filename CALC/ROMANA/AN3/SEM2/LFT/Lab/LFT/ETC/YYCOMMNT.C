/*
 * Copyright 1988 Mortice Kern Systems Inc.
 * All rights reserved.
 */
/*
 * skip comment input
 */

#include <stdio.h>
#include "yylex.h"

void
yycomment(mat)
	char *mat;
{
	register int c;
	register char *cp;

	for (cp = mat; *cp != 0; ) {
		c = input();
		if (c == EOF)
			yyerror("end of file in comment");
		if (c != *cp++) {
			cp = mat;
			if (c == *cp)
				cp++;
		}
	}
}
