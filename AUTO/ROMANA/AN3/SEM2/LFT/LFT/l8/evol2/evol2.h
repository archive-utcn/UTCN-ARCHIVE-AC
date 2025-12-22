typedef void (* Inst)();    /* tipul instructiunilor masinii este */
			    /* pointer la o functie ce returneaza void */
typedef struct Simbol { /* intrare in tabela de simboluri */
	char *nume;
	short tip; /*VAR, PREDEF ,NEDEF */
	union {
		double val;       /* daca e VAR */
		double (*ptr)();  /* daca e PREDEF */
		Inst defn;        /* FUNCTION, PROCEDURE */
		char *str;        /* STRING */
	}u;
	struct Simbol *urm;       /* simbolul urmator */
} Simbol;
Simbol *instal(), *caut(), *inststr(), *cautstr();

typedef union Data {   /* stiva de executie a interpretorului */
	double val;    /* o valoare ,sau */
	Simbol *simb;  /* un pointer in tabela de simboluri */
} Data;
extern Data pop();

typedef struct Predef {	char *nume;
			double (* func)();
} Predef;

extern Inst prog[],*progp,*progbase,*cod();
extern void eval(),add(),sub(),mul(),div(),negate(),power();
extern void assign(),predf(),varpush(),constpush(),print(),STOP();
extern void executa(),execerror(),varread();
extern void prexpr(),prstr();
extern void gt(),lt(),eq(),ge(),le(),ne(),and(),or(),not();
extern void ifcod(),whilecod(),call(),arg(),argassign();
extern void funcret(),procret(),ret(),define();
extern NPROG;