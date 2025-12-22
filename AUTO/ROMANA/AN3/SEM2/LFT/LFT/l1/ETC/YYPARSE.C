$L#line 2 "yacc parser: $P"

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
#define	YYDEBUG	$Y
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
$A
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
		$A
$L#line 238 "yacc parser: $P"
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
