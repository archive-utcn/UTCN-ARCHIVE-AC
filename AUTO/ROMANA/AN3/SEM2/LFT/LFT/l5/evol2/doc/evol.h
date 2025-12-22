/ª              EVOL²      EVOL.È              */

// Definitie structura tabela de simboluri

typedef struct _Simbol{
	char *nume;
	short tip;	// VAR, PREDEF, NEDEF
	union{
		double val;	// VAR
		double (*ptr)(double);
		}u;
	struct _Simbol *urm;
	}Simbol;
typedef union{
	double val;	  // un lexem poate fi sau un double
	Simbol *sim;	  // sau un pointer in tabela de simboluri
	}tiplexem;


#define 	NUMAR		01
#define		VAR		02
#define		PLUS		04
#define		MINUS		010
#define		STEA            020
#define		SLASH		040
#define		PARS		0100
#define		PARD		0200
#define		ATRIB		0400
#define		NL		01000
#define 	SAG		02000
#define		NEDEF		04000
#define		PREDEF		010000

extern Simbol *install(char *,int,double), *caut(char *);

extern void *alloc(unsigned);

extern double erexec(char *, char *);