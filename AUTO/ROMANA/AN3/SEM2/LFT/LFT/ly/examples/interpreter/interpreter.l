%{
#include <stdlib.h>
#include "types.h"
#include "y.tab.h"
%}

%%
 
  /* variables */
[a-z]           {
                   yylval.sIndex = *yytext - 'a';
                   return VARIABLE;
                }

  /* integers */                 
[0-9]+          {
                   yylval.iValue = atoi(yytext);
                   return INTEGER;
                }

  /* operators */
[-()<>=+/*;{}.] return *yytext;

">="            return GE;
"<="            return LE;
"=="            return EQ;
"!="            return NE;
"while"         return WHILE;
"if"            return IF;
"else"          return ELSE;
"print"         return PRINT;

[ \t\n]+        ;      // Skip whitespaces.

.               yyerror("Unknown character.\n");

%%

int yywrap(void)
{
    return 1;
}
