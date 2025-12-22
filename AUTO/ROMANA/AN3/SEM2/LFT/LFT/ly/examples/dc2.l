%{
#include "y.tab.h"
extern int yylval;
%}

%%

[A-Z]	{
		yylval = *yytext - 'A';
		return VARIABLE;
	}

[a-z]	{
		yylval = *yytext - 'a';
		return VARIABLE;
	}

[0-9]+	{
		yylval = strtol(yytext, (char **)NULL, *yytext=='0' ? 8:10);
		return INTEGER;
	}

0x[0-9a-fA-F]+	{
		yylval = strtol(yytext, (char **)NULL, 16);
		return INTEGER;
	}

[-()=+/*\n]	return *yytext;

[ \t]+	        ;

.		yyerror("Unknown character");
