/* print-int.y */
%{
 #include <stdio.h>
%}
%token INTEGER NEWLINE
%%
linii:	 /* empty ignora liniile vide*/
	| linii NEWLINE
	| linii olinie NEWLINE {printf("identifica nr.=%d\n", $2);}
	| error NEWLINE { yyerror("Includeti-nr-intreg."); 
	  /* sau "syntax error";*/ yyerrok;}
	;
olinie : INTEGER {$$ = $1;}
	;
%%

#include "lex.yy.c"

int main() {return yyparse();}

int yyerror(char *s) {fprintf(stderr,"%s\n",s);}
