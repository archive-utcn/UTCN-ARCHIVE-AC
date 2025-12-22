#include "conio.h"
#include "stdio.h"
#include "string.h"
#include "malloc.h"

main()
{ char aux[2048],*slmax=NULL, *smax=NULL;
  int n,i=0,l;
  printf("Dati numarul de siruri\n");
  scanf("%d",&n);
  fflush(stdin);
  for (;i<n;i++)
      { gets(aux);
        if (strlen(aux)>strlen(slmax))
           { slmax=(char*) realloc(slmax,strlen(aux)+1);
             strcpy(slmax,aux);
           }
        if (strcmp(aux,smax)>0)
           { smax=(char*) realloc(smax,strlen(aux)+1);
             strcpy(smax,aux);
           }
      }
  printf("%s\n%s",slmax,smax);
  getch();
}
