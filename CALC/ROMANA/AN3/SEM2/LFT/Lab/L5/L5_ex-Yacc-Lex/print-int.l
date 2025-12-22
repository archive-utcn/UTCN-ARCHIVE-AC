/* print-int.l */
%option noyywrap
%{
/* ! INCLUDETI */ 
	#include "y.tab.c"
	extern int yylval;
%}

%%
[0-9]+	{sscanf(yytext, "%d", &yylval); 
		 return(INTEGER);
		}
\n		{return (NEWLINE);}
.		{return (yytext[0]);}
%%
