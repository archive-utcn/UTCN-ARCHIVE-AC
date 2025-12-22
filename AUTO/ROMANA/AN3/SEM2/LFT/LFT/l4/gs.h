;; FISIERUL: gs.h
#include <stdio.h>
typedef enum{False,True} bool;

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
// Date comune
 extern set *automat[128][128];
// Alocator de memorie
extern char * makesir(char *);
// Interfata pentru crearea structurii ce contine regulile gramaticii
extern char* getsymb(FILE *);
extern char*  umplestruct(FILE *,prod *);
extern void  tipstruct(prod *);
// Interfata pentru construirea seturilor de terminale si neterminale
extern set* determin_set_neterminale(prod *);
extern set* determin_set_terminale(prod *,set *);
extern void tiparire_set(set *);
extern set* introdu_simbol_set(char*, set*);
extern void print_set(set *);
// Interfata pentru construirea automatului
char *determinare_stare_start(char *);
set *determinare_set_terminale_automat(set *);
set *determinare_stari_automat(set *);
prod *determinare_reguli_automat(prod *);
set *determinare_set_stari_finale(prod *);
// Interfata pentru construirea tabelei automatului
extern void tabel_automat(set *,prod *);
extern void print_automat(set *,set *);
