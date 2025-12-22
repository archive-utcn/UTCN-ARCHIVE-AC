#define EOI	0	/*	sfarsitul intrarii			          */
#define SEMI	1	/*		;					  */
#define PLUS	2	/*		+					  */
#define TIMES	3	/*		*					  */
#define LP	4	/*		(					  */
#define RP	5	/*		)					  */
#define NUM_ID	6	/*  numar zecimal sau identificator                       */

extern char *yytext;
extern int yyleng;
extern int yylineno;
