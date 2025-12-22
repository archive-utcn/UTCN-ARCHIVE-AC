typedef struct Simbol { /* intrare in tabela de simboluri */
	char *nume;
	short tip; /*VAR, PREDF ,UNDEF */
	union {
		double val;       /* daca e VAR */
		double (*ptr)();  /* daca e PREDEF */
	}u;
	struct Simbol *urm;      /* simbolul urmator */
} Simbol;
Simbol *instal(), *caut();

typedef union Data {             /* stiva de executie a interpretorului */
	double val;               /* o valoare ,sau */
	Simbol *simb;  		  /* un pointer in tabela de simboluri */
} Data;
extern Data pop();

typedef void (*Inst)();           /* tipul instructiunilor masinii este */
				  /* pointer la o functie ce returneaza void */
typedef struct Predef {
	char *nume;
	double (* func)();
} Predef;

extern Inst prog[],*progp,*cod();
extern void push(),eval(),add(),sub(),mul(),div(),negate(),power();
extern void assign(),predf(),varpush(),constpush(),print(),STOP();
extern void executa(),execerror();
extern void prexpr();
extern void gt(),lt(),eq(),ge(),le(),ne(),and(),or(),not();
extern void ifcod(),whilecod();
extern NPROG;