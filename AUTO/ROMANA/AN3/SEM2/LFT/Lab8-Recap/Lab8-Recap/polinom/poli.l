%option noyywrap
%{
#include "y.tab.h"
%}
%%
[1-9][0-9]*	{ yylval.nr = atoi(yytext);return NUMBER;}
x		return VAR;
[-+*()^\n]	return *yytext;
[ \t] 		;
.	yyerror("caracter necunoscut\n");
%%

