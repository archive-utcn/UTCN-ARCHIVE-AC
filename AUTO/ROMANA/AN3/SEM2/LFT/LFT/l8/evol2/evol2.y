%{
#include "evol2.h"
#define cod2(c1,c2)        cod(c1);cod(c2)
#define cod3(c1,c2,c3)     cod(c1);cod(c2);cod(c3)
%}

%union {               /* tipul stivei Yacc */
	Simbol* simb;  /* pointer in tabela de simboluri */
	Inst*   inst;  /* instructiune masina */
	int narg;      /* numar de argumente */
}

%token <simb> NUMAR STRING PRINT VAR PREDEF NEDEF WHILE IF
%token <simb> ELSE FUNCTION PROCEDURE RETURN FUNC PROC READ
%token <narg> ARG
%type <inst> instr asgn expr listainstr cond while
%type <inst> if begin end prlista
%type <simb> numeproc
%type <narg> listarg
%right '='
%left OR
%left AND
%left GT GE LT LE EQ NE
%left '+' '-'
%left '*' '/'
%left MINUSUNAR NOT
%right '^'
%%

lista	: /*vida*/
	| lista '\n'
	| lista defn '\n'
	| lista asgn '\n'   	{cod2(print,STOP);return 1;}
	| lista instr '\n'   	{cod(STOP);return 1;}
	| lista expr '\n'   	{cod2(print,STOP);return 1;}
	| lista error '\n'  	{yyerrok;}
	;
asgn	: VAR '=' expr {cod3(varpush,(Inst)$1,assign); $$=$3;}
	| ARG '=' expr {defnonly("$"); cod2(argassign,(Inst)$1),$$=$3;}
	;
instr	: expr          	{cod(pop);}
	| RETURN 		{defnonly("return");cod(procret);}
	| RETURN expr 		{defnonly("return");$$=$2;cod(funcret);}
	| PROCEDURE begin '(' listarg ')'
				{$$=$2; cod3(call,(Inst)$1,(Inst)$4);}
	| PRINT prlista 	{$$=$2;}
	| READ '(' VAR ')' 	{$$=cod2(varread,(Inst)$3);}
	| while cond instr end {
			($1)[1]=(Inst)$3;  /* corpul buclei */
			($1)[2]=(Inst)$4;} /* end */
	| if cond instr end {               /* if fara else */
			($1)[1]=(Inst)$3;  /* partea then */
			($1)[2]=(Inst)$4;}
	| if cond instr end ELSE instr end { /* if cu else */
			($1)[1]=(Inst)$3;  /* then */
			($1)[2]=(Inst)$6;  /* else */
			($1)[3]=(Inst)$7;} /* end */
	| '{' listainstr '}' {$$=$2;}
	;
cond	: '(' expr ')'  {cod(STOP);$$=$2;}
	| '(' expr ')' '\n' {cod(STOP); $$=$2;}
	;
while	: WHILE         {$$=cod3(whilecod,STOP,STOP);}
	;
if	: IF  		{$$=cod(ifcod);cod3(STOP,STOP,STOP);}
	;
begin	: /* vida */  	{$$=progp;}
	;
end	: /* vida */  	{cod(STOP);$$=progp;}
	;
listainstr : /* vida */  {$$=progp;}
	   | listainstr '\n'
	   | listainstr instr
	   ;
expr	: NUMAR	    	{$$=cod2(constpush,(Inst)$1);}
	| VAR           {$$=cod3(varpush,(Inst)$1,eval);}
	| ARG 		{defnonly("$");$$=cod2(arg,(Inst)$1);}
	| asgn
	| FUNCTION begin '(' listarg ')'
			{$$=$2;	cod3(call,(Inst)$1,(Inst)$4);}
	| PREDEF '(' expr ')'
			{$$=$3;cod2(predf,(Inst)$1);}
	| '(' expr ')'  {$$=$2;}
	| expr '+' expr             {cod(add);}
	| expr '-' expr             {cod(sub);}
	| expr '*' expr             {cod(mul);}
	| expr '/' expr             {cod(div);}
	| expr '^' expr             {cod(power);}
	| '-' expr %prec MINUSUNAR  {$$=$2;cod(negate);}
	| expr GT expr              {cod(gt);}
	| expr GE expr              {cod(ge);}
	| expr LT expr              {cod(lt);}
	| expr LE expr              {cod(le);}
	| expr EQ expr              {cod(eq);}
	| expr NE expr              {cod(ne);}
	| expr AND expr             {cod(and);}
	| expr OR expr              {cod(or);}
	| NOT expr                  {$$=$2; cod(not);}
	;
prlista	: expr	{cod(prexpr);}
	| STRING {$$=cod2(prstr,(Inst)$1);}
	| prlista ',' expr {cod(prexpr);}
	| prlista ',' STRING {cod2(prstr,(Inst)$3);}
	;
defn	: FUNC numeproc {$2->tip=FUNCTION;indef=1;}
	  '(' ')' instr  {cod(procret);define($2);indef=0;}
	| PROC numeproc {$2->tip=PROCEDURE;indef=1;}
	  '(' ')' instr  {cod(procret); define($2); indef=0;}
	;
numeproc: VAR
	| FUNCTION
	| PROCEDURE
	;
listarg : /* vida */ 		{$$=0;}
	| expr	 		{$$=1;}
	| listarg ',' expr 	{$$=$1+1;}
	;
%%

#include <stdio.h>
#include <ctype.h>
#include <math.h>
extern Simbol *simblist;
extern double Log(),Log10(),Exp(),Sqrt(),integer();
char *cmd;       /* pentru mesaje de eroare */
int nrlinie = 0;

#include <signal.h>
#include <setjmp.h>
jmp_buf begin;
int indef;
char *infile;   /* numele fisierului de intrare */
FILE *fin;      /* pointer la fis. de intrare */
FILE *inst;     /* ptr la fis ce contine codul ultimei instr */
char **gargv;   /* lista globala de argumente */
int gargc;

static struct {	char *nume;
		void (*func)();
} instructiuni[]={"pop", pop,	"eval",	eval,	"add",  add,	"sub",  sub,
"mul",  mul,      "div",  div,	"negate",negate,"power",power,
"assign",assign,  "predf",predf,		"varpush",varpush,
"constpush",constpush,		"print",print,	"STOP",STOP,
"prexpr",prexpr,  "gt",gt,	"lt",lt,	"eq",eq,	"ge",ge,
"le",le,          "ne",ne,	"and",and,	"or",or,	"not",not,
"ifcod",ifcod,    "whilecod",whilecod,		"varread",varread,
"argassign",argassign,		"arg",arg,	"procret",procret,
"funcret",funcret,"ret",ret,	"call",call,	"define",define,
"prstr",prstr,	0,	0 };
Predef predef[]={"sin",	sin,	"cos",	cos,	"atan", atan,
"log",  Log,	"log10", Log10,	"exp",Exp,	"sqrt",Sqrt,
"int",integer,	"abs",fabs,	0,0 };

main(argc,argv)
	char *argv[];	int argc;
{	void fpecatch(),init(),initcod(),afisare(),run();
	int i;
	cmd=argv[0];
	if((inst=fopen("istorie.txt","w")) == NULL) {
	   fprintf(stderr,"\nEroare la deschiderea fisierului: istorie.txt\n");
	   exit();
	}
	if(argc==1) { /* lista de argumente e vida */
	   static char *stdinonly[]={"stdin"};
	   gargv=stdinonly;
	   gargc=1;
	} else {   gargv=argv+1; /* avem argumente (fisiere de intrare) */
		   gargc=argc-1;
	}
	init(); 
	initcod();
	while(moreinput()) run();
	fclose(inst);
	return 0;
}

moreinput()
{	if(gargc-- <=0)	return 0;
	if(fin && fin !=stdin) fclose(fin);
	infile=*gargv++;
	nrlinie=1;
	if(strcmp(infile,"stdin") == 0) fin=stdin;
	else if ((fin=fopen(infile,"r"))==NULL) {
		fprintf(stderr,"%s: deschiderea %s este imposibila\n",
			cmd,infile);
		return moreinput();
	}
	return 1;
}

void run()  /* executie pina la EOF */
{	void fpecatch(),initcod(),afisare();
	setjmp(begin);
	signal(SIGFPE,fpecatch);
	for ( ; yyparse(); ) {
		char c;
		afisare(prog,inst);
		fprintf(inst,"\n\n===================================\n");
		if(fflush(inst)==EOF)
			fprintf(stderr,"%s : Eroare fflush :istorie.txt\n",cmd);
		afisare(prog,stdout);
		printf("\nDoriti executie [d/n]?");
		c=getc(stdin);
		putchar('\n');
		if(c=='D' || c=='d') executa(progbase);
		progp--; //elimin STOP-urile dintre instructiuni/linii
	}
}

void proc_fnc(p,file)
	Inst *p;	FILE *file;
{	Simbol *sp;
	for(sp=simblist;sp!=(Simbol *) 0;sp=sp->urm){
	  if((sp->tip == PROCEDURE) && ((Inst *)sp->u.defn == p))
		fprintf(file,"\n{begin of PROCEDURE} -> %s",sp->nume);
	  if((sp->tip == FUNCTION) &&  ((Inst *)sp->u.defn == p))
		fprintf(file,"\n{begin of FUNCTION} -> %s",sp->nume);
	}
}

void afisare(prog,file)
	Inst *prog;  FILE *file;
{	void afis(),proc_fnc();
	Inst *p;
	int contor;
	for(p=prog,contor=0;contor<7;p++){
		if((p-prog)%20==0 &&(p!=prog) && (file ==stdout)) {
		   printf("\n\t\tApasati o tasta pentru continuare!\n");
		   getc(stdin);
		}
		proc_fnc(p,file);
		fprintf(file,"\n[%3d] ",p-prog);
		if(*p==STOP) contor++;
		else contor=0;
		afis(*p,p,file);
	}
	putc('\n',file);
}

void afis(inst,pi,file)
	Inst inst,*pi;  FILE *file;
{	int i;
	void arata();

	for(i=0;instructiuni[i].nume;i++)
		if(inst==instructiuni[i].func){
			fprintf(file,"%s",instructiuni[i].nume);
			return;
		}

	switch(((Simbol *)(inst))->tip) {
	case VAR: fprintf(file,"=======>{VAR} %s==",((Simbol *)(inst))->nume);
			  fprintf(file,"%lf",	((Simbol *)(inst))->u.val);
			  return;
	case FUNCTION: fprintf(file,"=======>{FUNCTION} %s ->[%d]",
				((Simbol *)(inst))->nume,
				(Inst *)((Simbol *)(inst))->u.defn-prog);
			return;
	case PROCEDURE: fprintf(file,"=======>{PROCEDURE} %s ->[%d]",
				((Simbol *)(inst))->nume,
				(Inst *)((Simbol *)(inst))->u.defn-prog);
			return;
	case NUMAR: fprintf(file,"=======>{NUMAR} %lf",((Simbol *)(inst))->u.val);
			return;
	case STRING:arata(((Simbol *)(inst))->u.str,file);
				return;
	case NEDEF: fprintf(file,"=======>{NEDEF} %s",((Simbol *)(inst))->nume);
				return;
	}

	for(i=0;predef[i].nume;i++)
	   if( ( (double (*)()) ( ((Simbol *)(inst))->u.ptr) )
	   					==predef[i].func) {
			fprintf(file,"=======>{PREDF} %s",predef[i].nume);
			return;
	   }

	if(  ( ( ((Inst *)(inst)) -prog) < 200) &&
		 ( ( ((Inst *)(inst)) -prog) >   0) ) {
			fprintf(file,"----------> [%3d]",	(Inst *)(inst)-prog);
			return;
	}

	if(*(pi-1)==arg || *(pi-1)==argassign)
		fprintf(file,"*****>{ARG} $%d",((int)(inst)));
	else if(*(pi-2)==call)
		fprintf(file,"*****>{NR_de_ARG} ==%d",((int)(inst)));
	else  fprintf(file,">>>>> { ??? }");
	return;
}

void arata(c,file)    /* vizualizare sir cu caractere speciale */
	char *c;  FILE *file;
{	char *strchr();
	static char transtab[]="\bb\ff\nn\rr\tt";
	fprintf(file,"=======>{STRING} ");putc('"',file);
	for(;*c!='\0';c++)
		if(strchr(transtab,*c)&&!(isalpha(*c))){
			putc('\\',file);
			putc(strchr(transtab,*c)[1],file);
		}else	putc(*c,file);
	putc('"',file);
}


void execerror(s,t)        /* eroare de executie */
	char *s,*t;
{	void avert();
	avert(s,t);
	fseek(fin,0L,2);  /* abandonare fisier */
	longjmp(begin,0);  }

void fpecatch()            /* eroare aritmetica */
{	void execerror();
	execerror("eroare aritmetica",(char *) 0); }

int c; /* var. globala ptr. a fi utilizata si in warning() */
yylex()
{	while ((c=getc(fin)) == ' ' || c=='\t');
	if (c == EOF) return 0;
	if (c == '.' || isdigit(c)) { /* un numar */
		double d;
		ungetc(c,fin);
		fscanf(fin,"%lf" , &d);
		yylval.simb=instal("",NUMAR,d);
		return NUMAR;
	}
	if (isalpha(c)) {
		Simbol *s;
		char sbuf[100],*p=sbuf;
		do { if (p>=sbuf+sizeof(sbuf)-1){
			*p='\0';
			execerror("nume prea lung",sbuf);
		     }
		     *p++=c;
		} while ((c=getc(fin))!=EOF && isalnum(c));
		ungetc(c,fin);
		*p='\0';
		if ((s=caut(sbuf))==NULL)
			s=instal(sbuf,NEDEF,0.0);
		yylval.simb=s;
		return s->tip==NEDEF ? VAR : s->tip;
	}
	if (c=='$') {  /* argument ? */
	   int n=0;
	   while (isdigit(c=getc(fin)))	n=10*n+c-'0';
	   ungetc(c,fin);
	   if (n==0) execerror("aparitie ciudata a lui $ ...",(char *)0);
	   yylval.narg=n;
	   return ARG;
	}
	if (c == '"') {  /* lant/sir */
		char sbuf[100],*p,*emalloc();
		Simbol *s;
		for (p=sbuf;(c=getc(fin))!='"';p++){
		  if(c=='\n' || c==EOF)	execerror("lipsa ghilimele","");
		  if(p>=sbuf+sizeof(sbuf)-1){
			*p='\0';
			execerror("sir prea lung",sbuf);
		  }
		  *p=backslash(c);
		}
		*p=0;
		if((s=cautstr(sbuf))==0) s=inststr(sbuf);
		yylval.simb=s;
		return STRING;
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

backslash(c) /* interpreteaza \ */
	int c;
{	char *strchr();
	static char transtab[]="b\bf\fn\nr\rt\t";
	if (c!='\\') return c;
	c=getc(fin);
	if (islower(c) && strchr(transtab,c))
		return strchr(transtab,c)[1];
	return c;
}

urmator(asteptat,da,nu)
{	int c=getc(fin);
	if(c==asteptat) return da;
	ungetc(c,fin);
	return nu;
}

void defnonly(s)   /* definitie ilegala */
	char *s;
{	if (!indef) execerror(s,"in afara unei definitii "); }

void yyerror(s)  /* Implicit s="Eroare de sintaxa" */
	char *s;
{	void avert();
	avert(s , (char *) 0); }

void avert(s , t)    /* afiseaza mesajele de eroare */
	char *s, *t;
{	fprintf(stderr,"%s  %s",cmd,s);
	if(t) fprintf(stderr," %s",t);
	if(infile) fprintf(stderr," in %s",infile);
	fprintf(stderr," ->linia nr. %d\n",nrlinie);
	while(c!='\n' && c!=EOF)
		c=getc(fin); /* ignora sfirsitul de linie */
	if (c=='\n') nrlinie++;
}
