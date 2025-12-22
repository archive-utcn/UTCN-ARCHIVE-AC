/* i:\bin\YACC.EXE -ov evol1.c -D ytab.h evol1.y */
#line 1 "evol1.y"

#include "evol1.h"
#define cod2(c1,c2)        cod(c1);cod(c2)
#define cod3(c1,c2,c3)     cod(c1);cod(c2);cod(c3)
typedef union {              /* tipul stivei Yacc */
	Simbol *simb;  /* pointer in tabela de simboluri */
	Inst   *inst; /* instructiune masina */
} YYSTYPE;
#define NUMAR	257
#define PRINT	258
#define VAR	259
#define PREDEF	260
#define NEDEF	261
#define WHILE	262
#define IF	263
#define ELSE	264
#define OR	265
#define AND	266
#define GT	267
#define GE	268
#define LT	269
#define LE	270
#define EQ	271
#define NE	272
#define MINUSUNAR	273
#define NOT	274
extern int yychar, yyerrflag;
extern YYSTYPE yyval, yylval;
#line 85
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
extern double Log(),Log10(),Exp(),Sqrt(),integer();
char *cmd;       /* pentru mesaje de eroare */
int nrlinie = 0;

#include <signal.h>
#include <setjmp.h>
jmp_buf begin;


static struct { char *nume;
		void (*func)();
} instructiuni[]= { "pop", pop,	"eval",	eval,	"add",  add,
	"sub",  sub,  	"mul",  mul,	"div",  div,	"negate",negate,
	"power",power,	"assign",assign,"predf",predf,	"varpush",varpush,
	"constpush",constpush,		"print",print,	"STOP",STOP,
	"prexpr",prexpr,"gt",gt,	"lt",lt,	"eq",eq,
	"ge",ge,	"le",le,	"ne",ne,	"and",and,
	"or",or,	"not",not,	"ifcod",ifcod,
	"whilecod",whilecod,		0,	0 };

Predef predef[]={"sin",sin,	"cos",	cos,	"atan", atan,
"log",  Log,	"log10", Log10,	"exp",Exp,	"sqrt",Sqrt,
"int",integer,	"abs",fabs,	0,0  };

main(argc,argv)
	char *argv[];	int argc;
{	void fpecatch(),init(),initcode(),afisare();
	cmd=argv[0]; 
	init();
	setjmp(begin);
	signal(SIGFPE,fpecatch);
	for(initcod(); yyparse(); ){
		char c;
		afisare(prog);
		printf("\nDoriti executie [d/n]?");  c=getchar();
		putchar('\n');
		if(c=='D' || c=='d') executa(prog);
		progp--; //elimin STOP-urile dintre instructiuni/linii
	}
	return 0;
}

void afisare(prog)
	Inst *prog;
{	void afis();
	Inst *p;
	int contor;
	for(p=prog,contor=0;contor<7;p++){
		if((p-prog)%20==0 &&(p!=prog)) {
			printf("\n\n\t\tApasati o tasta pentru continuare !\n");
			getchar();
		}
		printf("\n[%3d]",p-prog);
		if (*p==STOP) contor++;
		else contor=0;
		afis(*p);
	}
	putchar('\n');
}

void afis(inst) Inst inst;
{	int i;
	for(i=0;instructiuni[i].nume;i++) 
		if(inst==instructiuni[i].func){
			printf("%s",instructiuni[i].nume);
			return;
		}

	if(((Simbol *)(inst))->tip==VAR) {
		printf("=======>%s ==",((Simbol *)(inst))->nume);
		printf("%lf {VAR}",((Simbol *)(inst))->u.val);
		return;
	}

	for(i=0;predef[i].nume;i++) 
		if( ( (double (*)())  ( ((Simbol *)(inst))->u.ptr) )
			== predef[i].func) {
		   printf("=======>%s {PREDEF}",predef[i].nume);
		   return;
		}

	if( ( ( ((Inst *)(inst))-prog ) < 200) &&
       	    ( ( ((Inst *)(inst))-prog ) > 0) ) {
		printf("------->[%3d]",((Inst *)(inst))-prog);
		return;
	}

	printf("=======>%lf",((Simbol *)(inst))->u.val);
	switch(((Simbol *)(inst))->tip) {
		case NUMAR:	printf(" {NUMAR}");
				break;
		case NEDEF:     printf(" {NEDEF}");
				break;
		default:        printf(" {NECUNOSCUT}");
	}
	return;
}

void execerror(s,t)        /* eroare de executie */
	char *s,*t;
{	void avert();
	avert(s,t);
	longjmp(begin,0); }

void fpecatch()            /* eroare aritmetica */
{	void execerror();
	execerror("eroare aritmetica",(char *) 0); }

yylex()
{	int c;
	while ((c=getchar()) == ' ' || c=='\t');
	if (c == EOF) return 0;
	if (c == '.' || isdigit(c)) { /* un numar */
		double d;
		ungetc(c,stdin);
		scanf("%lf" , &d);
		yylval.simb=instal("",NUMAR,d);
		return NUMAR;
	}
	if (isalpha(c)) {
		Simbol *s;
		char sbuf[100],*p=sbuf;
		do { *p++=c; }while ((c=getchar())!=EOF && isalnum(c));
		ungetc(c,stdin);
		*p='\0';
		if ((s=caut(sbuf))==NULL)
			s=instal(sbuf,NEDEF,0.0);
		yylval.simb=s;
		return s->tip==NEDEF ? VAR : s->tip;
	}
	switch(c) {
		case '>':    return urmator('=',GE,GT);
		case '<':    return urmator('=',LE,LT);
		case '=':    return urmator('=',EQ,'=');
		case '!':    return urmator('=',NE,NOT);
		case '|':    return urmator('|',OR,'|');
		case '&':    return urmator('&',AND,'&');
		case '\n':   nrlinie++; return '\n';
		default:     return c;
	}
}

urmator(asteptat,da,nu)
{	int c=getchar();
	if(c==asteptat) return da;
	ungetc(c,stdin);
	return nu; }

void yyerror(s)  /* Implicit s="Eroare de sintaxa" */
	char *s;
{	void avert();
	avert(s , (char *) 0); }

void avert(s , t)    /* afiseaza mesajele de eroare */
	char *s, *t;
{	fprintf(stderr,"%s  %s",cmd,s);
	if(t)	fprintf(stderr," %s",t);
	fprintf(stderr," ->linia nr. %d\n",nrlinie); }static short yydef[] = {
	  -1,    7,   42,   22,   13,    5,    4,   27,    3,   21, 
	  20,   19,   18,   17,   16,   15,   14,   12,   11,   10, 
	   9,    8,    6,   27
};
static short yyex[] = {
	   0,    0,   -1,    1
};
static short yyact[] = {
	 -74,  -55,  -56,  -61,  -50,  -60,  -51,   -2,  -54,  -64, 
	 -63,  -57,  274,  263,  262,  260,  259,  258,  257,  256, 
	 123,   45,   40,   10,  -55,  -56,  -60,   -2,  -54,  -57, 
	 274,  260,  259,  257,   45,   40,  -46,   40,  -44,   40, 
	 -41,   61,  -69,   10,  -70,  -30,  -28,  -29,  -31,  -32, 
	 -40,  -39,  -33,  -34,  -35,  -36,  -37,  -38,  272,  271, 
	 270,  269,  268,  267,  266,  265,   94,   47,   45,   43, 
	  42,   10,  -71,   10,  -72,   10,  -32,   94,  -58,  -30, 
	 -28,  -29,  -31,  -32,  -40,  -39,  -33,  -34,  -35,  -36, 
	 -37,  -38,  272,  271,  270,  269,  268,  267,  266,  265, 
	  94,   47,   45,   43,   42,   41,  -75,  -55,  -56,  -61, 
	 -66,  -60,  -51,   -2,  -54,  -64,  -63,  -57,  274,  263, 
	 262,  260,  259,  258,  257,  125,  123,   45,   40,   10, 
	 -55,  -56,  -61,  -60,  -51,   -2,  -54,  -64,  -63,  -57, 
	 274,  263,  262,  260,  259,  258,  257,  123,   45,   40, 
	 -30,  -28,  -29,  -31,  -32,  -40,  -39,  -33,  -34,  -35, 
	 -36,  -37,  -38,  272,  271,  270,  269,  268,  267,  266, 
	 265,   94,   47,   45,   43,   42,  -59,  -30,  -28,  -29, 
	 -31,  -32,  -40,  -39,  -33,  -34,  -35,  -36,  -37,  -38, 
	 272,  271,  270,  269,  268,  267,  266,  265,   94,   47, 
	  45,   43,   42,   41,  -65,  -30,  -28,  -29,  -31,  -32, 
	 -40,  -39,  -33,  -34,  -35,  -36,  -37,  -38,  272,  271, 
	 270,  269,  268,  267,  266,  265,   94,   47,   45,   43, 
	  42,   41,  -30,  -28,  -29,  -31,  -32,  -39,  -33,  -34, 
	 -35,  -36,  -37,  -38,  272,  271,  270,  269,  268,  267, 
	 266,   94,   47,   45,   43,   42,  -30,  -28,  -29,  -31, 
	 -32,  -33,  -34,  -35,  -36,  -37,  -38,  272,  271,  270, 
	 269,  268,  267,   94,   47,   45,   43,   42,  -30,  -28, 
	 -29,  -31,  -32,   94,   47,   45,   43,   42,  -30,  -31, 
	 -32,   94,   47,   42,  -25,  264,   -1
};
static short yypact[] = {
	  12,   41,   75,   77,   77,  163,  163,  232,  163,  244, 
	 267,  283,  283,  283,  283,  283,  283,   77,   77,   77, 
	 291,  291,  295,  296,  140,  218,  190,   30,   30,   30, 
	  30,   30,   30,   30,   30,   30,   30,   30,   30,   30, 
	  30,  140,  140,   30,  118,   30,   92,   73,   58,   43, 
	  30,   39,   39,   37,   30,   30,   30
};
static short yygo[] = {
	 -24,   -8,  -62,  -76,  -48,   44,   42,   41,   24,   -3, 
	 -77,    0,  -49,  -22,  -21,  -20,  -19,  -18,  -17,  -16, 
	 -15,  -14,  -13,  -12,  -11,  -10,   -9,  -26,  -27,   -6, 
	 -47,   -5,   -4,   -7,   56,   55,   54,   50,   45,   43, 
	  40,   39,   38,   37,   36,   35,   34,   33,   32,   31, 
	  30,   29,   28,   27,    0,  -45,  -42,  -43,   51,  -52, 
	 -53,  -68,  -67,  -23,   23,    7,   -1,   -1
};
static short yypgo[] = {
	   0,    0,    0,   10,    4,    4,    4,   33,   33,   33, 
	  33,   33,   33,   33,   33,   33,   33,   33,   33,   33, 
	  33,   33,   33,   33,   33,   33,   55,   63,   60,   59, 
	  57,    4,    4,    4,   66,   66,   66,   66,   66,   66, 
	  55,   55,   33,    0
};
static short yyrlen[] = {
	   0,    0,    0,    3,    1,    2,    4,    1,    3,    3, 
	   3,    3,    3,    2,    3,    3,    3,    3,    3,    3, 
	   3,    3,    2,    3,    4,    1,    0,    0,    1,    1, 
	   3,    3,    7,    4,    3,    3,    3,    3,    0,    2, 
	   2,    2,    1,    2
};
#define YYS0	72
#define YYDELTA	34
#define YYNPACT	57
#define YYNDEF	24

#define YYr41	0
#define YYr42	1
#define YYr43	2
#define YYr7	3
#define YYr8	4
#define YYr9	5
#define YYr11	6
#define YYr22	7
#define YYr26	8
#define YYr27	9
#define YYr28	10
#define YYr29	11
#define YYr30	12
#define YYr31	13
#define YYr32	14
#define YYr33	15
#define YYr34	16
#define YYr35	17
#define YYr36	18
#define YYr37	19
#define YYr38	20
#define YYr39	21
#define YYr40	22
#define YYr25	23
#define YYr24	24
#define YYr21	25
#define YYr18	26
#define YYr17	27
#define YYr16	28
#define YYr15	29
#define YYr14	30
#define YYr13	31
#define YYr12	32
#define YYr10	33
#define YYr6	34
#define YYr5	35
#define YYr4	36
#define YYr3	37
#define YYrACCEPT	YYr41
#define YYrERROR	YYr42
#define YYrLR2	YYr43
#line 2 "yacc parser: i:/etc/yyparse.c"

/*
 * Automaton to interpret LALR(1) tables.
 *
 *	Macros:
 *		yyclearin - clear the lookahead token.
 *		yyerrok - forgive a pending error
 *		YYERROR - simulate an error
 *		YYACCEPT - halt and return 0
 *		YYABORT - halt and return 1
 *		YYRETURN(value) - halt and return value.  You should use this
 *			instead of return(value).
 *		YYREAD - ensure yychar contains a lookahead token by reading
 *			one if it does not.  See also YYSYNC.
 *
 *	Preprocessor flags:
 *		YYDEBUG - includes debug code.  The parser will print
 *			 a travelogue of the parse if this is defined
 *			 and yydebug is non-zero.
 *		YYSSIZE - size of state and value stacks (default 150).
 *		YYSTATIC - By default, the state stack is an automatic array.
 *			If this is defined, the stack will be static.
 *			In either case, the value stack is static.
 *		YYALLOC - Dynamically allocate both the state and value stacks
 *			by calling malloc() and free().
 *		YYLR2 - defined if lookahead is needed to resolve R/R or S/R conflicts
 *		YYSYNC - if defined, yacc guarantees to fetch a lookahead token
 *			before any action, even if it doesnt need it for a decision.
 *			If YYSYNC is defined, YYREAD will never be necessary unless
 *			the user explicitly sets yychar = -1
 *
 *	Copyright (c) 1983, by the University of Waterloo
 */

#ifndef YYSSIZE
# define YYSSIZE	150
#endif
#ifndef	YYDEBUG
#define	YYDEBUG	0
#endif
#define YYERROR		goto yyerrlabel
#define yyerrok		yyerrflag = 0
#define yyclearin	yychar = -1
#define YYACCEPT	YYRETURN(0)
#define YYABORT		YYRETURN(1)
#ifdef YYALLOC
# define YYRETURN(val)	{ retval = (val); goto yyReturn; }
#else
# define YYRETURN(val)	return(val)
#endif
#if YYDEBUG
/* The if..else makes this macro behave exactly like a statement */
# define YYREAD	if (yychar < 0) {					\
			if ((yychar = yylex()) < 0)			\
				yychar = 0;				\
			if (yydebug)					\
				printf("read %s (%d)\n", yyptok(yychar),\
				yychar);				\
		} else
#else
# define YYREAD	if (yychar < 0) {					\
			if ((yychar = yylex()) < 0)			\
				yychar = 0;				\
		} else
#endif
#define YYERRCODE	256		/* value of `error' */
#if defined(__TURBOC__)&&__SMALL__
#define	YYQYYP	*(int *)((int)yyq + ((int)yyq-(int)yyp))
#else
#define	YYQYYP	yyq[yyq-yyp]
#endif

YYSTYPE	yyval,				/* $$ */
	*yypvt,				/* $n */
	yylval;				/* yylex() sets this */

int	yychar,				/* current token */
	yyerrflag,			/* error flag */
	yynerrs;			/* error count */

#if YYDEBUG
int yydebug = YYDEBUG-0;		/* debug flag & tables */
extern char	*yysvar[], *yystoken[], *yyptok();
extern short	yyrmap[], yysmap[];
extern int	yynstate, yynvar, yyntoken, yynrule;
# define yyassert(condition, msg, arg) \
	if (!(condition)) { printf("\nyacc bug: "); printf(msg, arg); YYABORT; }
#else /* !YYDEBUG */
# define yyassert(condition, msg, arg)
#endif

yyparse()
{

	register short		yyi, *yyp;	/* for table lookup */
	register short		*yyps;		/* top of state stack */
	register short		yystate;	/* current state */
	register YYSTYPE	*yypv;		/* top of value stack */
	register short		*yyq;
	register int		yyj;

#ifdef YYSTATIC
	static short	yys[YYSSIZE + 1];
	static YYSTYPE	yyv[YYSSIZE + 1];
#else
#ifdef YYALLOC
	YYSTYPE *yyv;
	short	*yys;
	YYSTYPE save_yylval, save_yyval, *save_yypvt;
	int save_yychar, save_yyerrflag, save_yynerrs;
	int retval;
#if 0	/* defined in <stdlib.h>*/
	extern char	*malloc();
#endif
#else
	short		yys[YYSSIZE + 1];
	static YYSTYPE	yyv[YYSSIZE + 1];	/* historically static */
#endif
#endif

#ifdef YYALLOC
	yys = (short *) malloc((YYSSIZE + 1) * sizeof(short));
	yyv = (YYSTYPE *) malloc((YYSSIZE + 1) * sizeof(YYSTYPE));
	if (yys == (short *)0 || yyv == (YYSTYPE *)0) {
		yyerror("Not enough space for parser stacks");
		return 1;
	}
	save_yylval = yylval;
	save_yyval = yyval;
	save_yypvt = yypvt;
	save_yychar = yychar;
	save_yyerrflag = yyerrflag;
	save_yynerrs = yynerrs;
#endif

	yynerrs = 0;
	yyerrflag = 0;
	yychar = -1;
	yyps = yys;
	yypv = yyv;
	yystate = YYS0;		/* start state */

yyStack:
	yyassert((unsigned)yystate < yynstate, "state %d\n", yystate);
	if (++yyps > &yys[YYSSIZE]) {
		yyerror("Parser stack overflow");
		YYABORT;
	}
	*yyps = yystate;	/* stack current state */
	*++yypv = yyval;	/* ... and value */

#if YYDEBUG
	if (yydebug)
		printf("state %d (%d), char %s (%d)\n", yysmap[yystate],
			yystate, yyptok(yychar), yychar);
#endif

	/*
	 *	Look up next action in action table.
	 */
yyEncore:
#ifdef YYSYNC
	YYREAD;
#endif
	if (yystate >= sizeof yypact/sizeof yypact[0]) 	/* simple state */
		yyi = yystate - YYDELTA;	/* reduce in any case */
	else {
		if(*(yyp = &yyact[yypact[yystate]]) >= 0) {
			/* Look for a shift on yychar */
#ifndef YYSYNC
			YYREAD;
#endif
			yyq = yyp;
			yyi = yychar;
#if 0&&defined(__TURBOC__)&&__SMALL__
	/* THIS ONLY WORKS ON TURBO C 1.5 !!! */
			/* yyi is in di, yyp is in si */
		L01:
			asm lodsw	/* ax = *yyp++; */
			asm cmp yyi, ax
			asm jl L01
#else
			while (yyi < *yyp++)
				;
#endif
			if (yyi == yyp[-1]) {
				yystate = ~YYQYYP;
#if YYDEBUG
				if (yydebug)
					printf("shift %d (%d)\n", yysmap[yystate], yystate);
#endif
				yyval = yylval;		/* stack what yylex() set */
				yychar = -1;		/* clear token */
				if (yyerrflag)
					yyerrflag--;	/* successful shift */
				goto yyStack;
			}
		}

		/*
	 	 *	Fell through - take default action
	 	 */

		if (yystate >= sizeof yydef /sizeof yydef[0])
			goto yyError;
		if ((yyi = yydef[yystate]) < 0)	 { /* default == reduce? */
											/* Search exception table */
			yyassert((unsigned)~yyi < sizeof yyex/sizeof yyex[0],
				"exception %d\n", yystate);
			yyp = &yyex[~yyi];
#ifndef YYSYNC
			YYREAD;
#endif
			while((yyi = *yyp) >= 0 && yyi != yychar)
				yyp += 2;
			yyi = yyp[1];
			yyassert(yyi >= 0,"Ex table not reduce %d\n", yyi);
		}
	}

#ifdef YYLR2
yyReduce:	/* reduce yyi */
#endif
	yyassert((unsigned)yyi < yynrule, "reduce %d\n", yyi);
	yyj = yyrlen[yyi];
#if YYDEBUG
	if (yydebug) printf("reduce %d (%d), pops %d (%d)\n", yyrmap[yyi],
		yyi, yysmap[yyps[-yyj]], yyps[-yyj]);
#endif
	yyps -= yyj;		/* pop stacks */
	yypvt = yypv;		/* save top */
	yypv -= yyj;
	yyval = yypv[1];	/* default action $$ = $1 */
	switch (yyi) {		/* perform semantic action */
		
case YYr3: {	/* lista :  lista asgn '\n' */
#line 28
cod2(print,STOP);return 1;
} break;

case YYr4: {	/* lista :  lista instr '\n' */
#line 29
cod(STOP);return 1;
} break;

case YYr5: {	/* lista :  lista expr '\n' */
#line 30
cod2(print,STOP);return 1;
} break;

case YYr6: {	/* lista :  lista error '\n' */
#line 31
yyerrok;
} break;

case YYr7: {	/* asgn :  VAR '=' expr */
#line 33
 yyval.inst=yypvt[0].inst; cod3(varpush,(Inst)yypvt[-2].simb,assign);
} break;

case YYr8: {	/* instr :  expr */
#line 35
cod(pop);
} break;

case YYr9: {	/* instr :  PRINT expr */
#line 36
cod(prexpr); yyval.inst=yypvt[0].inst;
} break;

case YYr10: {	/* instr :  while cond instr end */
#line 37

			(yypvt[-3].inst)[1]=(Inst)yypvt[-1].inst;  
			(yypvt[-3].inst)[2]=(Inst)yypvt[0].inst;
} break;

case YYr11: {	/* instr :  if cond instr end */
#line 40
               
			(yypvt[-3].inst)[1]=(Inst)yypvt[-1].inst;  
			(yypvt[-3].inst)[2]=(Inst)yypvt[0].inst;
} break;

case YYr12: {	/* instr :  if cond instr end ELSE instr end */
#line 43
 
			(yypvt[-6].inst)[1]=(Inst)yypvt[-4].inst;  
			(yypvt[-6].inst)[2]=(Inst)yypvt[-1].inst;  
			(yypvt[-6].inst)[3]=(Inst)yypvt[0].inst;
} break;

case YYr13: {	/* instr :  '{' listainstr '}' */
#line 47
 cod(STOP); yyval.inst=yypvt[-1].inst; 
} break;

case YYr14: {	/* cond :  '(' expr ')' */
#line 49
cod(STOP); yyval.inst=yypvt[-1].inst;
} break;

case YYr15: {	/* while :  WHILE */
#line 51
yyval.inst=cod3(whilecod,STOP,STOP);
} break;

case YYr16: {	/* if :  IF */
#line 53
yyval.inst=cod(ifcod); cod3(STOP,STOP,STOP);
} break;

case YYr17: {	/* end :  */
#line 55
cod(STOP); yyval.inst=progp;
} break;

case YYr18: {	/* listainstr :  */
#line 57
yyval.inst=progp;
} break;

case YYr21: {	/* expr :  NUMAR */
#line 61
yyval.inst=cod2(constpush,(Inst)yypvt[0].simb);
} break;

case YYr22: {	/* expr :  VAR */
#line 62
yyval.inst=cod3(varpush,(Inst)yypvt[0].simb,eval);
} break;

case YYr24: {	/* expr :  PREDEF '(' expr ')' */
#line 65
yyval.inst=yypvt[-1].inst; cod2(predf,(Inst)yypvt[-3].simb);
} break;

case YYr25: {	/* expr :  '(' expr ')' */
#line 66
yyval.inst=yypvt[-1].inst;
} break;

case YYr26: {	/* expr :  expr '+' expr */
#line 67
cod(add);
} break;

case YYr27: {	/* expr :  expr '-' expr */
#line 68
cod(sub);
} break;

case YYr28: {	/* expr :  expr '*' expr */
#line 69
cod(mul);
} break;

case YYr29: {	/* expr :  expr '/' expr */
#line 70
cod(div);
} break;

case YYr30: {	/* expr :  expr '^' expr */
#line 71
cod(power);
} break;

case YYr31: {	/* expr :  '-' expr */
#line 72
yyval.inst=yypvt[0].inst;cod(negate);
} break;

case YYr32: {	/* expr :  expr GT expr */
#line 73
cod(gt);
} break;

case YYr33: {	/* expr :  expr GE expr */
#line 74
cod(ge);
} break;

case YYr34: {	/* expr :  expr LT expr */
#line 75
cod(lt);
} break;

case YYr35: {	/* expr :  expr LE expr */
#line 76
cod(le);
} break;

case YYr36: {	/* expr :  expr EQ expr */
#line 77
cod(eq);
} break;

case YYr37: {	/* expr :  expr NE expr */
#line 78
cod(ne);
} break;

case YYr38: {	/* expr :  expr AND expr */
#line 79
cod(and);
} break;

case YYr39: {	/* expr :  expr OR expr */
#line 80
cod(or);
} break;

case YYr40: {	/* expr :  NOT expr */
#line 81
yyval.inst=yypvt[0].inst; cod(not);
} break;
#line 238 "yacc parser: i:/etc/yyparse.c"
	case YYrACCEPT:
		YYACCEPT;
	case YYrERROR:
		goto yyError;
#ifdef YYLR2
	case YYrLR2:
#ifndef YYSYNC
		YYREAD;
#endif
		yyj = 0;
		while(yylr2[yyj] >= 0) {
			if(yylr2[yyj] == yystate && yylr2[yyj+1] == yychar
			&& yylook(yys+1,yyps,yystate,yychar,yy2lex(),yylr2[yyj+2]))
					break;
			yyj += 3;
		}
		if(yylr2[yyj] < 0)
			goto yyError;
		if(yylr2[yyj+2] < 0) {
			yystate = ~ yylr2[yyj+2];
			goto yyStack;
		}
		yyi = yylr2[yyj+2];
		goto yyReduce;
#endif
	}

	/*
	 *	Look up next state in goto table.
	 */

	yyp = &yygo[yypgo[yyi]];
	yyq = yyp++;
	yyi = *yyps;
#if	0&&defined(__TURBOC__) && __SMALL__
	/* THIS ONLY WORKS ON TURBO C 1.5 !!! */
	/* yyi is in di, yyp is in si */
L02:
	asm lodsw		/* ax = *yyp++; */
	asm cmp yyi, ax
	asm jl L02
#else
	while (yyi < *yyp++)
		;
#endif
	yystate = ~(yyi == *--yyp? YYQYYP: *yyq);
	goto yyStack;

yyerrlabel:	;		/* come here from YYERROR	*/
/*
#pragma used yyerrlabel
 */
	yyerrflag = 1;
	yyps--, yypv--;
	
yyError:
	switch (yyerrflag) {

	case 0:		/* new error */
		yynerrs++;
		yyi = yychar;
		yyerror("Syntax error");
		if (yyi != yychar) {
			/* user has changed the current token */
			/* try again */
			yyerrflag++;	/* avoid loops */
			goto yyEncore;
		}

	case 1:		/* partially recovered */
	case 2:
		yyerrflag = 3;	/* need 3 valid shifts to recover */
			
		/*
		 *	Pop states, looking for a
		 *	shift on `error'.
		 */

		for ( ; yyps > yys; yyps--, yypv--) {
			if (*yyps >= sizeof yypact/sizeof yypact[0])
				continue;
			yyp = &yyact[yypact[*yyps]];
			yyq = yyp;
			do
				;
			while (YYERRCODE < *yyp++);
			if (YYERRCODE == yyp[-1]) {
				yystate = ~YYQYYP;
				goto yyStack;
			}
				
			/* no shift in this state */
#if YYDEBUG
			if (yydebug && yyps > yys+1)
				printf("Error recovery pops state %d (%d), uncovers %d (%d)\n",
					yysmap[yyps[0]], yyps[0],
					yysmap[yyps[-1]], yyps[-1]);
#endif
			/* pop stacks; try again */
		}
		/* no shift on error - abort */
		break;

	case 3:
		/*
		 *	Erroneous token after
		 *	an error - discard it.
		 */

		if (yychar == 0)  /* but not EOF */
			break;
#if YYDEBUG
		if (yydebug)
			printf("Error recovery discards %s (%d), ",
				yyptok(yychar), yychar);
#endif
		yyclearin;
		goto yyEncore;	/* try again in same state */
	}
	YYABORT;

#ifdef YYALLOC
yyReturn:
	yylval = save_yylval;
	yyval = save_yyval;
	yypvt = save_yypvt;
	yychar = save_yychar;
	yyerrflag = save_yyerrflag;
	yynerrs = save_yynerrs;
	free((char *)yys);
	free((char *)yyv);
	return(retval);
#endif
}

#ifdef YYLR2
yylook(s,rsp,state,c1,c2,i)
short *s;		/* stack		*/
short *rsp;		/* real top of stack	*/
int state;		/* current state	*/
int c1;			/* current char		*/
int c2;			/* next char		*/
int i;			/* action S < 0, R >= 0	*/
{
	int j;
	short *p,*q;
	short *sb,*st;
#if YYDEBUG
	if(yydebug) {
		printf("LR2 state %d (%d) char %s (%d) lookahead %s (%d)",
			yysmap[state],state,yyptok(c1),c1,yyptok(c2),c2);
		if(i > 0)
			printf("reduce %d (%d)\n", yyrmap[i], i);
		else
			printf("shift %d (%d)\n", yysmap[i], i);
	}
#endif
	st = sb = rsp+1;
	if(i >= 0)
		goto reduce;
  shift:
	state = ~i;
	c1 = c2;
	if(c1 < 0)
		return 1;
	c2 = -1;

  stack:
  	if(++st >= &s[YYSSIZE]) {
		yyerror("Parser Stack Overflow");
		return 0;
	}
	*st = state;
	if(state >= sizeof yypact/sizeof yypact[0])
		i = state- YYDELTA;
	else {
		p = &yyact[yypact[state]];
		q = p;
		i = c1;
		while(i < *p++)
			;
		if(i == p[-1]) {
			state = ~q[q-p];
			c1 = c2;
			if(c1 < 0)
				return 1;
			c2 = -1;
			goto stack;
		}
		if(state >= sizeof yydef/sizeof yydef[0])
			return 0
		if((i = yydef[state]) < 0) {
			p = &yyex[~i];
			while((i = *p) >= 0 && i != c1)
				p += 2;
			i = p[1];
		}
	}
  reduce:
  	j = yyrlen[i];
	if(st-sb >= j)
		st -= j;
	else {
		rsp -= j+st-sb;
		st = sb;
	}
	switch(i) {
	case YYrERROR:
		return 0;
	case YYrACCEPT:
		return 1;
	case YYrLR2:
		j = 0;
		while(yylr2[j] >= 0) {
			if(yylr2[j] == state && yylr2[j+1] == c1)
				if((i = yylr2[j+2]) < 0)
					goto shift;
				else
					goto reduce;
		}
		return 0;
	}
	p = &yygo[yypgo[i]];
	q = p++;
	i = st==sb ? *rsp : *st;
	while(i < *p++);
	state = ~(i == *--p? q[q-p]: *q);
	goto stack;
}
#endif
		
#if YYDEBUG
	
/*
 *	Print a token legibly.
 *	This won't work if you roll your own token numbers,
 *	but I've found it useful.
 */
char *
yyptok(i)
{
	static char	buf[10];

	if (i >= YYERRCODE)
		return yystoken[i-YYERRCODE];
	if (i < 0)
		return "";
	if (i == 0)
		return "$end";
	if (i < ' ')
		sprintf(buf, "'^%c'", i+'@');
	else
		sprintf(buf, "'%c'", i);
	return buf;
}
#endif
#ifdef YYDEBUG
char * yystoken[] = {
	"error",
	"NUMAR",
	"PRINT",
	"VAR",
	"PREDEF",
	"NEDEF",
	"WHILE",
	"IF",
	"ELSE",
	"OR",
	"AND",
	"GT",
	"GE",
	"LT",
	"LE",
	"EQ",
	"NE",
	"MINUSUNAR",
	"NOT",
	0
};
char * yysvar[] = {
	"$accept",
	"instr",
	"asgn",
	"expr",
	"listainstr",
	"cond",
	"while",
	"if",
	"end",
	"lista",
	0
};
short yyrmap[] = {
	  41,   42,   43,    7,    8,    9,   11,   22,   26,   27, 
	  28,   29,   30,   31,   32,   33,   34,   35,   36,   37, 
	  38,   39,   40,   25,   24,   21,   18,   17,   16,   15, 
	  14,   13,   12,   10,    6,    5,    4,    3,    1,    2, 
	  19,   20,   23,    0
};
short yysmap[] = {
	   1,   13,   17,   19,   21,   28,   52,   55,   56,   57, 
	  58,   59,   60,   61,   62,   63,   64,   65,   66,   67, 
	  68,   69,   72,   75,   74,   53,   48,   43,   42,   41, 
	  40,   39,   38,   37,   36,   35,   34,   33,   32,   31, 
	  29,   27,   26,   25,   24,   23,   22,   16,   15,   14, 
	  12,   11,   10,    5,    4,    3,    2,   47,   70,    6, 
	   9,   54,    7,    8,   71,   51,   76,   73,   30,   44, 
	  45,   46,    0,   18,   50,   49,   20
};
int yyntoken = 31, yynvar = 10, yynstate = 77, yynrule = 44;
#endif
