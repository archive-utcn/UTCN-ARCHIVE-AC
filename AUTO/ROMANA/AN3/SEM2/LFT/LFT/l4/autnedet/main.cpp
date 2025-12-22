#include <stdio.h>
#include "gs.h"
//#include <process.h>

void main(int argc, char* argv[])
{  FILE *fpin;
   char *start;
   set *neterm, *term, *stari;
   prod *gram, *reguli;
   if(argc>1) {
      if((fpin=fopen(argv[1],"r"))==0) {
	 printf("Nu pot deschide fisierul %s ca intrare !\n",argv[1]);
	 exit(1);
      }
      if(argc>2)
	 if(freopen(argv[2],"w",stdout)==0) {
	    printf("Nu pot deschide fisierul %s ca iesire !\n",argv[2]);
	    exit(1);
	 }
   }
   else fpin=stdin;
   start=umplestruct(fpin,gram);
   printf("Simbolul de start este %s\nProductiile gramaticii:\n",start);
   tipstruct(gram);
   printf("Apasati o tasta pt. continuare !\n");
   getchar();
   printf("Starea de start este %s\nRegulile automatului sint:\n",start);
   reguli=determinare_reguli_automat(gram);
   tipstruct(reguli);
   printf("Apasati o tasta pt. continuare !\n");
   getchar();
   neterm=determin_set_neterminale(gram);
   printf("Setul neterminalelor:");
   print_set(neterm); putchar('\n');
   term=determin_set_terminale(gram,neterm);
   printf("Setul terminalelor:");
   print_set(term);  putchar('\n');
   printf("Setul starilor automatului:");
   print_set(stari=determinare_stari_automat(neterm)); putchar('\n');
   printf("Setul starilor finale:");
   print_set(determinare_set_stari_finale(gram));
   printf("\nReprezentarea sub forma tabelara a automatului:\n");
   tab_aut(stari,reguli);
   print_aut(term,stari);
}
