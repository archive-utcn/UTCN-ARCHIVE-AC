%token NUMBER,ID
%left '+' '-'     /* asociativitate stinga ;aceeasi prioritate */
%left '*' '/'     /* asociativitate stinga ;prioritate superioara */
%left UNARYMINUS  /* prioritate mai mare decit a '*' si '/' */ 

%%
list	: /*vida*/
	| list '\n'
	| list expr '\n' {fprintf(stderr,"\n-----------------------");
			  fprintf(stderr,"\nIntroduceti sirul :\n");}
	;
expr	: NUMBER	        {
				fprintf(stderr,"\nNUMBER -> expr");
				}
	| ID			{
				fprintf(stderr,"\nID -> expr");
				}
	| expr '+' expr         {
				fprintf(stderr,"\nexpr + expr -> expr");
				}
	| expr '-' expr         {
				fprintf(stderr,"\nexpr - expr -> expr");
				}
	| expr '*' expr         {
				fprintf(stderr,"\nexpr * expr -> expr");
				}
	| expr '/' expr         {
				fprintf(stderr,"\nexpr / expr -> expr");
				}
	| '-' expr %prec UNARYMINUS 
				{
				fprintf(stderr,"\n- expr -> expr");
				}
	| '(' expr ')'          {
				fprintf(stderr,"\n( expr ) -> expr ");
				}
	;
%%

#include <stdio.h>
#include <ctype.h>
void main()
{
	printf("\nIntroduceti sirul :\n");
	yyparse();
}
