#include <process.h>
#include <conio.h>
#include "gs.h"

set *automat[128][128];

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
  tipstruct(productii);
  printf("\nSetul neterminalelor este: \n");
  tiparire_set(neterminale);
  printf("\nSetul terminalelor este: \n");
  tiparire_set(terminale);

  // determinare elemente automat

char *start_automat = determinare_stare_start(start);
set *terminale_automat = determinare_set_terminale_automat(terminale);
set *stari_automat = determinare_stari_automat(neterminale);
prod *reguli = determinare_reguli_automat(productii);
set *stari_finale = determinare_set_stari_finale(productii);

   // tiparire automat
  getch();
  printf("\nStarea de start este : %s\n",start_automat);
  printf("\nSetul terminalelor automatului este: \n");
  tiparire_set(terminale_automat);
  printf("\nSetul starilor este: \n");
  tiparire_set(stari_automat);
  tipstruct(reguli);
  printf("\nSetul starilor finale : \n");
  tiparire_set(stari_finale);

  // Initializare automat
  for(int i = 0;i<128;i++)
	for(int j=0;j<128;j++)
		automat[i][j] = NULL;

  getch();
  // Incarcare tabela automat
  tabel_automat(stari_automat,reguli);
  printf("\nTabela automatului :\n");
  print_automat(terminale_automat,stari_automat);
  }
