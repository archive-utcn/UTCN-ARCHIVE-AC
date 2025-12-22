#include <string.h>
#include <stdio.h>
//#include <conio.h>
#include "gs.h"


void main(int argc,char *argv[])
{
  char *start;
  prod *productii,*pu;
  FILE *f;
  set *terminale,*neterminale;

  productii=pu=new prod;

  if((f=fopen(argv[1],"r")) == NULL){
	printf("nu se poate deschide %s\n",argv[1]);
	printf("apelul programului se face cu un argument:\n\t\t");
	printf("numele fisierului in care ati descris productiile\n");
	exit(0);
	}

  // determinare elemente gramatica

  start = makesir(umplestruct(f,pu));
  neterminale = determin_set_neterminale(productii);
  terminale = determin_set_terminale(productii,neterminale);

  // tiparire elemente gramatica

  printf("\nSimbolul de start este : %s\n",start);
  printf("\nProductiile gramaticii sint: \n");
  tipstruct(productii);
  printf("\nSetul neterminalelor este: \n");
  tiparire_set(neterminale);
  printf("\nSetul terminalelor este: \n");
  tiparire_set(terminale);

  // determinare elemente automat

// Interfata pentru construirea automatului

char *start_stiva=determinare_simbol_stiva_start(start);
char *stare_initiala=determinare_stare_initiala_automat();
char *stari_finale=determinare_set_stari_finale();
char *stari_automat=determinare_stari_automat();
set *term_aut=determinare_set_terminale_automat(terminale);
prod *reguli=determinare_reguli_automat(productii,terminale);
set *simboluri_stiva=determinare_set_simboluri_stiva_automat(terminale,neterminale);

   // tiparire automat
  getchar();
  printf("\nStarea de start stiva este : %s",start_stiva);
  printf("\nStarea initiala a automatului este : %s",stare_initiala);
  printf("\nSetul starilor finale este : %s",stari_finale);
  printf("\nSetul starilor automatului este : %s\n",stari_automat);
  printf("\nSetul terminalelor automatului este: \n");
  tiparire_set(term_aut);
  printf("\nRegulile automatului sint : %s\n");
  tipstruct(reguli);
  printf("\nSetul simbolurilor stiva este : \n");
  tiparire_set(simboluri_stiva);
  getchar();

 char input[20];
 printf("Introduceti sirul de intrare : ");
 scanf("%s",input);
 while( strcmp(input,"")){
	 if (acceptare(start_stiva,stare_initiala,input,reguli,term_aut))
		printf("\nExpresie recunoscuta");
	 else
		printf("\n Expresia nu apartine limbajului");
	 printf("\nIntroduceti sirul de intrare : ");
         scanf("%s",input);
	 }
  }
