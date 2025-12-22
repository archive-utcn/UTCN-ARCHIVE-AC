/* print-int.l */
%option noyywrap
%{
%}
%%
[0-9]+	{sscanf(yytext, "%d", &yylval); 
		 return(INTEGER);
		}
\n		{return (NEWLINE);}
.		{return (yytext[0]);}
%%