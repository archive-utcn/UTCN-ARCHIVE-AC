%{
#include "ytab.h"
%}

%%

[1-9][0-9]*		return NUMBER;
[a-zA-Z][a-zA-Z0-9]*	return ID;
[-+/*\n\)\(]		return *yytext;
[ \t]+			;
