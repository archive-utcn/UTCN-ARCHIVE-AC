/* B:\bin\YACC.EXE -o reg.c reg.y */
#define CHAR	257
#define OR	258
#define CAT	259
#define STAR	260
#line 17 "reg.y"

#include <stdio.h>
#include <process.h>
#include <ctype.h>

#define TRUE 1
#define FALSE 0
#define NOTFOUND -1

char *ind = "                                        ";
char t[3]={'|', '&', '*'};


#define MAXLIN 350
#define MAXSET 400
#define NCHARS 128
#define NSTATES 128
#define FINAL -1
#define NIL 0
#define ITMPSTAT for(count=0,i=1; i<=line; i++) tmpstat[i] = FALSE


typedef int STATE;

char gotofn[NSTATES][NCHARS], out[NSTATES];
STATE state[NSTATES], nstates;

int name[MAXLIN],left[MAXLIN],right[MAXLIN],parent[MAXLIN],follow[MAXLIN];

int line=1,sets[MAXSET],nextset;

char *input,*cmd;

int count,tmpstat[MAXLIN], dflag;

/* Declaratii functii */

void cfollow(int);
void include(int*,int);
void execute(char *);
void prstr(char*,char*,char*);
void prautom(void);
void prtrarr(void);
void prfoll(void);
void prstates(void);

extern int yychar, yyerrflag;
#ifndef YYSTYPE
#define YYSTYPE int
#endif
extern YYSTYPE yyval, yylval;
#line 79
void yyerror(s)    char *s;
{ fprintf(stderr, "%s: %s\n",cmd,s);
  exit(1);
}

void overflo()
{ fprintf(stderr,"%s: expresie regulata este prea mare",cmd);
  exit(1);
}

yylex(void)
{  register char c;
   switch(c = *input++){
	case '|' : return OR;
	case '*' : return STAR;
	case '(' :
	case ')' : return c;
	case '\0': return 0;
	default  : yylval= c; return CHAR;
	}
}

enter(x)
{ if(line >= MAXLIN)
	overflo();
  name[line]=x; left[line]=right[line]=NIL;
  return line++;
}

node(x,l,r)
{ if(line >= MAXLIN)
	overflo();
  name[line]=x; left[line]=l; right[line]=r;
  parent[l]=parent[r]=line;
  return line++;
}

unary(x,l)
{ if(line >= MAXLIN)
	overflo();
  name[line]=x; left[line]=l; right[line]=NIL;
  parent[l]=line;
  return line++;
}

void cfoll(v)
{  register i;
   if(left[v] == NIL) { /* atom */
	ITMPSTAT;
	cfollow(v);
	include(follow,v);
	}
   else{
	cfoll(left[v]);
	if(right[v] != NIL)
		cfoll(right[v]);
	}
}

void cfollow(v)
{  int p;
   if (v == line)
	return;
   p=parent[v];
   switch(name[p]){
	case STAR: cfirst(v); cfollow(p); return;
	case OR :  cfollow(p); return;
	case CAT : if (v == left[p]) { /* fiul sting */
			if(cfirst(right[p]))
				cfollow(p);
			}
		   else
			cfollow(p);
		   return;
	case FINAL : if (!tmpstat[line]){
				tmpstat[line]=TRUE;
				count++;
				}
		     return;
	}
}

int cfirst(v)
{ /* TRUE - EMPTY  incluse; FALSE - EMPTY neincluse */
  register b;
  if(left[v] == NIL){ /* atom */
	if(!tmpstat[v]){
		tmpstat[v]=TRUE;count++;
		}
	return FALSE;
	}
  else if(right[v] == NIL) { /* unary : STAR */
	cfirst(left[v]);
	return TRUE;
	}
  else if(name[v] == CAT){
	return cfirst(left[v]) && cfirst(right[v]);
	}
  else{  /* OR */
	b = cfirst(right[v]);
	return cfirst(left[v]) || b;
	}
}

void include(int *array,int n)
{ register i,j,set;
  for(i=0;i<nextset;i+=sets[i]+1){
	if(sets[i] == count){
		for(j=0,set=i+1; j < count; j++)
			if(!tmpstat[sets[set++]])
				goto next;
		array[n] = i;
		return;
		}
	next: ;
  }
  if(nextset+count > MAXSET)
	overflo();
  array[n] = nextset;  sets[nextset++] = count;
  for(i=0;i<=line;i++)
	if(tmpstat[i])
		sets[nextset++] = i;
}

void cgotofn()
{  register c,i,k;
   STATE n,s;
   char symbol[NCHARS];
   int set,curnode,num;
   int number,newnode;
   STATE x;
   ITMPSTAT;
   include(state,0);
   if(cfirst(line-1)){
	tmpstat[line]=TRUE;
	count++; out[1]=TRUE;
	}
   include(state,nstates=1);
   if(dflag)
	prstates();
   for(n=s=1;s<=n;s++){
	/* extragere caractere asteptate in s (in symbol[]) */
	for(i=0;i<NCHARS;i++)
		symbol[i]=FALSE;
	num=sets[state[s]];
	for(i=0,set=state[s]+1;i<num;i++,set++){
		curnode = sets[set];
		if((c = name[curnode]) >= 0){
			if(c < NCHARS)
				symbol[c] = TRUE;
			else
				printf("combinatie ciudata\n");
		}
	}

	/* gotofn[s][0..NCHAR-1] */
	for(c=0;c<NCHARS;c++)
		if(symbol[c]){
			/* nextstate(s,c) */
			ITMPSTAT;
			for(i=0,set=state[s]+1;i<num;i++,set++){
				curnode=sets[set];
				if(name[curnode] == c){
					number=sets[follow[curnode]];
					newnode=follow[curnode]+1;
					for(k=0;k<number;k++,newnode++)
						if(!tmpstat[sets[newnode]]){
							tmpstat[sets[newnode]] = TRUE;
							count++;
							}
					}
			} /* end nextstate */

		if((x=getstate(n)) != NOTFOUND)
			gotofn[s][c] = x;
		else{
			if(n >= NSTATES)
				overflo();
			include(state,nstates = ++n);
			if(dflag)
				prstates();
			if(tmpstat[line])
				out[n]=TRUE;
			gotofn[s][c]=n;
			}
		}
	}
}

STATE getstate(n)
{  register i,j,set;
   for(i=0;i <= n; i++){
	if(sets[state[i]] == count){
		for(set = state[i]+1, j=0; j < count; j++)
			if(!tmpstat[sets[set++]])
				goto next;
			return i;
			}
		next: ;
		}
	return NOTFOUND;
}

void main(int argc, char *argv[])
{ int ac;
  char **av,*w;
  ac=argc; av=argv;
  while(ac-- > 0 )
	printf(" %s",*av++);
  putchar('\n');
  cmd=argv[0];
  while(--argc > 0 && (++argv)[0][0] == '-'){
	w=argv[0]+1;
	while(*w)
		switch(*w++){
			case 'd' : dflag++; continue;
			default : goto ext;
			}
	}
  if(argc < 2){
ext:	fprintf(stderr, "Usage: %s [-d] xreg string\n",cmd);
	exit(1);
	}
  input = *argv++;
  yyparse();
  if(dflag){
	prtrarr();printf("\n\n\n");getch();
	}
  cfoll(line-1);
  if(dflag){
	prfoll();printf("\n\n\n");getch();
	}
  cgotofn();
  if(dflag){
	prautom();printf("\n\n\n");getch();
	}
  execute(*argv);
  exit(0);
}

void execute(char *str)
{  register char *q, *s, *mem;
   register stat;
   mem=str;
   while(*str){
	s=q=str;
	stat=1;
	while(*q){
		if(!(stat = gotofn[stat][*q++&0177]))
			break;
		if(out[stat])
			s=q;
		}
	if(s > str || out[1])
		prstr(str,s,mem);
	str++;
	}
}

void prstr(char *p,char *q,char *start)
{  char s[200];
   char *start1,*p1,*q1;
   printf("\n");
   strcpy(s,start);
   start1=s;p1=start1+(p-start);q1=start1+(q-start);
   while(start1 < p1)
	putchar(*start1++);
   while(p1 < q1)
	putchar(toupper(*p1++));
   while(*q1)
	putchar(*q1++);
}


void prtree(i,n)
{  int j,k,m;
   if(n){
	prtree(i+4,right[n]);
	if(name[n] < NCHARS) { /* char */
		printf("%s%c",ind+40-i,name[n] == FINAL ? '#' : name[n]);
		if(name[n] == FINAL)
			putchar('\n');
		else{
			j=follow[n];
			m=k=sets[j++];
			putchar('{');
			while(k-- > 0){
				if(m-k > 1)
					putchar(',');
				printf("%d",sets[j++]);
				}
			printf("}\n");
		}
	}
	else  /* OR CAT STAR */
		printf("%s%c\n",ind+40-i,t[name[n]-OR]);
	prtree(i+4,left[n]);
	}
}

void prautom()
{ register i,j;
  prstates();
  printf("    ");
  for(i = 'a'; i < 't' ; i++)
	printf("  %c",i);
  putchar('\n');
  for(j=0;j<=nstates;j++){
	printf("%2d %d",j,out[j]);
	for(i='a'; i< 't'; i++)
		printf(" %2d",gotofn[j][i]);
	putchar('\n');
	}
}

void prtrarr()
{ register i;
  printf("      ");
  for(i=0;i<line;i++)
	printf(" %2d",i);
  printf("\nname  ");
  for(i=0;i<line;i++)
	if(name[i] < NCHARS) /* CHAR */
		printf("  %c",name[i] == FINAL ? '#' : name[i]);
	else  /* OR CAT STAR */
		printf("  %c",t[name[i]-OR]);
  printf("\nleft  ");
  for(i=0;i<line;i++)
	printf(" %2d",left[i]);
  printf("\nright ");
  for(i=0;i<line;i++)
	printf(" %2d",right[i]);
  printf("\nparent");
  for(i=0;i<line;i++)
	printf(" %2d",parent[i]);
  putchar('\n');
}

void prfoll()
{  register i,j;
   j=line>nextset ? line : nextset;
   printf("      ");
   for(i=0;i<j;i++)
	printf(" %2d",i);
  printf("\ntmpsta");
  for(i=0;i<line;i++)
	printf(" %2d",tmpstat[i]);
  printf("\nfollow");
  for(i=0;i<line;i++)
	printf(" %2d",follow[i]);
  printf("\nsets  ");
  for(i=0;i<nextset;i++)
	printf(" %2d",sets[i]);
  putchar('\n');
  prtree(0,line);
}

void prstates()
{  register i,j;
   j=nstates>nextset ? nstates : nextset-1;
   printf("\n      ");
   for(i=0;i<j;i++)
	printf(" %2d",i);
  printf("\ntmpsta");
  for(i=0;i<line;i++)
	printf(" %2d",tmpstat[i]);
  printf("\nstate ");
  for(i=0;i<nstates;i++)
	printf(" %2d",state[i]);
  printf("\nsets  ");
  for(i=0;i<nextset;i++)
	printf(" %2d",sets[i]);
  putchar('\n');
  getch();
}

static short yydef[] = {
	  -1,   -5,   -9,  -19
};
static short yyex[] = {
	   0,    3,   -1,    1,    0,    0,   -1,    1,    0,    5, 
	 257,    5,  258,    5,   41,    5,   -1,    1,    0,    4, 
	 258,    4,   41,    4,   -1,    1
};
static short yyact[] = {
	  -7,  -12,  -11,  257,  256,   40,   -7,  -12,  -11,   -5, 
	 -10,  260,  258,  257,  256,   40,   -7,   -9,  -12,  -11, 
	  -5,  -10,  260,  258,  257,  256,   41,   40,   -7,  -12, 
	 -10,  260,  256,   40,   -7,  -12,  -11,  -10,  260,  257, 
	 256,   40,   -1
};
static short yypact[] = {
	  11,   16,   31,   38,    3,   22,    3,    3
};
static short yygo[] = {
	  -2,   -4,   -6,   -1,   -3,    7,    6,    4,   -1
};
static short yypgo[] = {
	   0,    0,    0,    0,    4,    4,    4,    4,    4,    4,    0
};
static short yyrlen[] = {
	   0,    0,    0,    1,    3,    2,    3,    2,    1,    1,    2
};
#define YYS0	7
#define YYDELTA	2
#define YYNPACT	8
#define YYNDEF	4

#define YYr8	0
#define YYr9	1
#define YYr10	2
#define YYr1	3
#define YYr3	4
#define YYr4	5
#define YYr6	6
#define YYr5	7
#define YYr2	8
#define YYrACCEPT	YYr8
#define YYrERROR	YYr9
#define YYrLR2	YYr10
#line 2 "yacc parser: /etc/yyparse.c"

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
		
case YYr1: {	/* s :  r */
#line 67 "reg.y"
 unary(FINAL, yypvt[0]); line--;
} break;

case YYr2: {	/* r :  CHAR */
#line 70
 yyval = enter(yypvt[0]); 
} break;

case YYr3: {	/* r :  r OR r */
#line 71
 yyval = node(OR,yypvt[-2],yypvt[0]);
} break;

case YYr4: {	/* r :  r r */
#line 72
 yyval = node(CAT,yypvt[-1],yypvt[0]);
} break;

case YYr5: {	/* r :  r STAR */
#line 73
 yyval = unary(STAR,yypvt[-1]);
} break;

case YYr6: {	/* r :  '(' r ')' */
#line 74
 yyval = yypvt[-1]; 
} break;
#line 238 "yacc parser: /etc/yyparse.c"
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
	"CHAR",
	"OR",
	"CAT",
	"STAR",
	0
};
char * yysvar[] = {
	"$accept",
	"s",
	"r",
	0
};
short yyrmap[] = {
	   8,    9,   10,    1,    3,    4,    6,    5,    2,    7,    0
};
short yysmap[] = {
	   4,    5,    9,   11,    8,    6,    2,    0,   10,    7, 
	   3,    1
};
int yyntoken = 8, yynvar = 3, yynstate = 12, yynrule = 11;
#endif
