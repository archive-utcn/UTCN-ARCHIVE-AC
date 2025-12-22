/* print-int.l */
%option noyywrap
%{
/* ! e INCLUDETI */ 
	#include "y.tab.h"
	extern int yylval;
%}

%%
[0-9]+	{sscanf(yytext, "%d", &yylval); 
		 return(INTEGER);
		}
\n		{return (NEWLINE);}
.		{return (yytext[0]);}
%%
