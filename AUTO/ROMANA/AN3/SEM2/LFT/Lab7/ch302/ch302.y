%{
#include <stdio.h>
#include <stdlib.h>
%}
%token NAME NUMBER
%left '-''+'
%left '*' '/'
%nonassoc UMINUS

%%
statement:	NAME '=' expression	{ printf("pretending to assign %s the value %d\n", $1, $3); }
	;
	|	expression	{ printf("= %d\n", $1); }
	;
expression:	expression '+' expression	{ $$ = $1 + $3;
						printf ("Recognized '+' expression.\n");
						}
	|	expression '-' expression 	{ $$ = $1 - $3;
						printf ("Recognized '­-' expression.\n");
						}
	|	expression '*' expression 	{ $$ = $1 * $3;
 						printf ("Recognized '*' expression.\n");
 						}
 						|
	|	expression '/' expression	{ if ($3 == 0)
							            yyerror ("divide by zero");
						             else
							            $$ = $1 / $3;
						            printf ("Recognized '/' expression.\n");
						}
	|   '-' expression %prec UMINUS { $$ = - $2;
                                    printf ("Recognized negation.\n");
                                    }
    |   '(' expression ')'          {$$ = $2;
                                    printf("Recognzied parenthesized.\n");
                                    }                                
    |	NUMBER	{ $$ = $1;
			printf ("Recognized a number.\n");
			}
	;
%%
//#include "lex.yy.c"
//#include <ctype.h>
int main (void) {
return yyparse();
}

int yyerror(char *s) {;}/*implicit syntax error*/ 
			