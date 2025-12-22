%{
#include "y.tab.h"
%}

%%

[A-Z]	{
		yylval.variable = *yytext - 'A';
		return VARIABLE;
	}

[a-z]	{
		yylval.variable = *yytext - 'a';
		return VARIABLE;
	}

[0-9]+	{
		yylval.ivalue = strtol(yytext, (char **)NULL, *yytext=='0' ? 8:10);
		return INTEGER;
	}

0x[0-9a-fA-F]+	{
		yylval.ivalue = strtol(yytext, (char **)NULL, 16);
		return INTEGER;
	}

[-{}()<>=+/*;]	return *yytext;

">="		return GE;
"<="		return LE;
"=="		return EQ;
"!="		return NE;

"while"		return WHILE;
"if"		return IF;
"else"		return ELSE;
"print"		return PRINT;

[ \t\n]+	;

.		yyerror("Unknown character");
