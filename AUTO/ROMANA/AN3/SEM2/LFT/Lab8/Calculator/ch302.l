%option noyywrap
%{
//#include "ch302.tab.h"
#include "y.tab.c"
extern int yylval;
%}
%%
[0-9]+  { yylval = atoi (yytext);
        return NUMBER; }
[ \t]   {}
\n      { 
        return 0;
        }
.       { 
        return yytext[0];
        }
%%