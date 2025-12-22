#include <stdio.h>

typedef bool enum {False,True};

// Definitia structurii ce contine regulile gramaticii

typedef struct _prod{
	char *car;
	char *cdr;
	struct _prod *urm;
	}prod;

// Definitia structurii seturilor simbolurilor terminale si neterminale

typedef struct _set{
	char *simbol;
	struct _set *urm;
	}set;


// Alocator de memorie

extern char * makesir(char *);

// Interfata pentru crearea structurii ce contine regulile gramaticii

extern char* getsymb(FILE *);
extern char* umplestruct(FILE *,prod *);
extern void  tipstruct(prod *);

// Interfata pentru construirea seturilor de terminale si neterminale

extern set* determin_set_neterminale(prod *);
extern set* determin_set_terminale(prod *,set *);
extern void tiparire_set(set *);
extern set* introdu_simbol_set(char*, set*);
extern bool is_member(char *,set *);

// Interfata pentru construirea automatului

char *determinare_simbol_stiva_start(char *);
char *determinare_stare_initiala_automat(void);
char *determinare_set_stari_finale(void);
char *determinare_stari_automat(void);
set *determinare_set_terminale_automat(set *);
prod *determinare_reguli_automat(prod *,set *);
set *determinare_set_simboluri_stiva_automat(set *,set *);

// Interfata acceptare intrare pentru automatul construit

bool acceptare(char *,char *,char *,prod *,set *);
char* strrev(char*);

