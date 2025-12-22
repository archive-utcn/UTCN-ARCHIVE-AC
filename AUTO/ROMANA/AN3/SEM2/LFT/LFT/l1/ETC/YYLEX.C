/*
 * Copyright 1988 Mortice Kern Systems Inc.
 * All rights reserved.
 */
/*
 * table interpreter code
 */

#ifdef	YY_DEBUG
#undef	YY_DEBUG
#define	YY_DEBUG(fmt, a1, a2)	fprintf(stderr, fmt, a1, a2)
#else
#define	YY_DEBUG(fmt, a1, a2)
#endif

#ifndef	YY_NOSCANNER

#ifndef	YYLEX
#define	YYLEX yylex		/* lexical analyser name */
#endif

/* stdin and stdout may not be constants */
FILE   *yyin = stdin;
FILE   *yyout = stdout;

/*
 * yytext is defined to be yy_tbuf.
 * yy_sbuf[0:yyleng-1] contains the states corresponding to yy_tbuf.
 * yy_tbuf[0:yyleng-1] contains the current token.
 * yy_tbuf[yyleng:yy_end-1] contains pushed-back characters.
 * When the user action routine is active,
 * yy_save contains yy_tbuf[yyleng], which is set to '\0'.
 * Things are different when YY_PRESERVE is defined. 
 */

static	yy_state_t yy_sbuf [YYLMAX+1];	/* state buffer */
unsigned char yy_tbuf [YYLMAX+1]; /* text buffer */

#ifndef YY_PRESERVE	/* the efficient default push-back scheme */

static	unsigned char yy_save;	/* saved yytext[yyleng] */

#define	YY_USER	{ /* set up yytext for user */ \
		yy_save = yytext[yyleng]; \
		yytext[yyleng] = 0; \
	}
#define	YY_SCANNER { /* set up yytext for scanner */ \
		yytext[yyleng] = yy_save; \
	}

#else		/* not-so efficient push-back for yytext mungers */

static	unsigned char yy_save [YYLMAX];
static	unsigned char *yy_push = yy_save+YYLMAX;

#define	YY_USER { \
		size_t n = yy_end - yyleng; \
		yy_push = yy_save+YYLMAX - n; \
		if (n > 0) \
			memmove(yy_push, yytext+yyleng, n); \
		yytext[yyleng] = 0; \
	}
#define	YY_SCANNER { \
		size_t n = yy_save+YYLMAX - yy_push; \
		if (n > 0) \
			memmove(yytext+yyleng, yy_push, n); \
		yy_end = yyleng + n; \
	}

#endif

int	yy_actype;		/* special action */
int	yylineno = 1;		/* line number */
int	yyleng = 0;		/* yytext token length */
int	yy_end = 0;		/* end of pushback */
int	yy_start = 0;		/* start state */
int	yy_lastc = YYNEWLINE;	/* previous char */

#endif

#if __STDC__
int YYLEX(void) {
#else
int YYLEX()
{
#endif
	register int c, i, st, base;
	int fmin, fmax;			/* yy_la_act indices of final states */
	int oldi, oleng;		/* base i, yyleng before look-ahead */

	i = yyleng;
	YY_SCANNER;

  start:
	yyleng = i;
	/* determine previous char. */
	if (i > 0)
		yy_lastc = yytext[i-1];
	/* scan previously accepted token adjusting yylineno */
	while (i > 0)
		if (yytext[--i] == YYNEWLINE)
			yylineno++;
	/* adjust pushback */
	yy_end -= yyleng;
	memmove(yytext, yytext+yyleng, (size_t) yy_end);
	i = 0;

  more:
	oldi = i;

	/* run the state machine until it jams */
	for (yy_sbuf[i] = st = yy_begin[yy_start + (yy_lastc == YYNEWLINE)];
	     !(st == yy_endst || YY_INTERACTIVE && yy_base[st] > yy_nxtmax && yy_default[st] == yy_endst);
	     yy_sbuf[++i] = st) {
		YY_DEBUG("<state %d, i = %d>\n", st, i);
		if (i >= YYLMAX)
			YY_FATAL("Token buffer overflow");

		/* get input char */
		if (i < yy_end)
			c = yy_tbuf[i];		/* get pushback char */
		else if ((c = yygetc()) != EOF) {
			yy_end = i+1;
			yy_tbuf[i] = c = (unsigned char) c;
		} else /* c == EOF */ {
			if (i == oldi)	/* no token */
				if (yywrap())
					return 0;
				else
					goto start;
			else
				break;
		}
		YY_DEBUG("<input %d = 0x%02x>\n", c, c);

		/* look up next state */
		while ((base = yy_base[st]+c) > yy_nxtmax || yy_check[base] != st) {
			if (st == yy_endst)
				goto jammed;
			st = yy_default[st];
		}
		st = yy_next[base];
	  jammed: ;
	}
	YY_DEBUG("<stopped %d, i = %d>\n", st, i);
	if (st != yy_endst)
		++i;

  reject:
	/* search backward for a final state */
	while (--i > oldi) {
		st = yy_sbuf[i];
		if ((fmin = yy_final[st]) < (fmax = yy_final[st+1]))
			goto final;	/* found final state(s) */
	}
	/* no match, default action */
	i = oldi + 1;
	output(yy_tbuf[oldi]);
	goto start;

  final:
	YY_DEBUG("<final state %d, i = %d>\n", st, i);
	oleng = i;		/* save length for REJECT */
	
	/* pushback look-ahead RHS */
	if ((c = (int)(yy_la_act[fmin]>>9) - 1) >= 0) { /* trailing context? */
		unsigned char *bv = yy_look + c*YY_LA_SIZE;
		static unsigned char bits [8] = {
			1<<0, 1<<1, 1<<2, 1<<3, 1<<4, 1<<5, 1<<6, 1<<7
		};
		while (i > oldi) {
			st = yy_sbuf[--i];
			if (bv[(unsigned)st/8] & bits[(unsigned)st%8])
				break;
		}
	}

	/* perform action */
	yyleng = i;
	YY_USER;
	c = yy_action(yy_la_act[fmin] & 0777);
	YY_SCANNER;
	i = yyleng;

	/* process special actions */
	YY_DEBUG("<actype %d, return %d>\n", yy_actype, c);
	switch (yy_actype) {
	  case YY_RETURN:		/* action did return */
		YY_USER;
		return c;

	  case YY_SKIP:			/* action fell through */
		goto start;

	  case YY_REJECT:		/* REJECT */
		i = oleng;		/* restore original yytext */
		if (++fmin < fmax)
			goto final;	/* another final state, same length */
		else
			goto reject;	/* try shorter yytext */

	  case YY_MORE:			/* yymore() */
		if (i > 0)
			yy_lastc = yytext[i-1];
		goto more;
	}
}

#ifndef	YY_NOSCANNER

/*
 * user callable routines
 */

/* get input char with pushback */
int
input()
{
	int c;
#ifndef YY_PRESERVE
	if (yy_end > yyleng) {
		yy_end--;
		memmove(yytext+yyleng, yytext+yyleng+1,
			(size_t) (yy_end-yyleng));
		c = yy_save;
		YY_USER;
#else
	if (yy_push < yy_save+YYLMAX) {
		c = *yy_push++;
#endif
	} else
		c = yygetc();
	yy_lastc = c;
	if (c == YYNEWLINE)
		yylineno++;
	return c;
}

/* pushback char */
int
unput(c)
	int c;
{
#ifndef YY_PRESERVE
	if (yy_end >= YYLMAX)
		YY_FATAL("Push-back buffer overflow");
	if (yy_end > yyleng) {
		yytext[yyleng] = yy_save;
		memmove(yytext+yyleng+1, yytext+yyleng,
			(size_t) (yy_end-yyleng));
		yytext[yyleng] = 0;
	}
	yy_end++;
	yy_save = c;
#else
	if (yy_push <= yy_save)
		YY_FATAL("Push-back buffer overflow");
	*--yy_push = c;
#endif
	if (c == YYNEWLINE)
		yylineno--;
	return c;
}

/* accept first `n' chars of token */
void
yyless(n)
	int n;
{
	if (n < 0 || n > yy_end)
		return;
	YY_SCANNER;
	yyleng = n;			/* adjust pushback */
	YY_USER;
}

#endif
