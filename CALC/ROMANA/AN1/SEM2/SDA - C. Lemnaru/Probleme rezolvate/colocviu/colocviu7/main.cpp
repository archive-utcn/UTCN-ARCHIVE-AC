// program l2_3_3.cpp
// buffer circular cu studenti pe care actioneaza
// principiul producator - consumator

#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>
#include <time.h>
#include <windows.h>

typedef struct tip_nod { int i;
                         tip_nod *nx;
		               };

void adaugare_dupa_el_x(tip_nod **l,int id)
{ tip_nod *p=(tip_nod*) malloc(sizeof(tip_nod));
  p->i=id;
  if (*l)
     { p->nx=(*l)->nx;
       (*l)->nx=p;
     }
     else
         p->nx=p;
  (*l)=p;
}

void eliminare_dupa_el_x(tip_nod **l)
{ tip_nod *aux=(*l)->nx;
  if (aux!=(*l))
     (*l)->nx=aux->nx;
     else
         (*l)=NULL;
  free(aux);
}

void list(tip_nod *l)
{ tip_nod *aux=l;
  if (l)
     { printf(" eliminare %d\n",aux->i);
       aux=aux->nx;
     }
     else
         printf("\n\nLista goala\n");
  while (l!=aux)
        { printf(" eliminare %d\n",aux->i);
          aux=aux->nx;
        }
}

void eliberare(tip_nod **a)
{ tip_nod *aux;
  while ((*a)->nx!=(*a))
        { aux=(*a)->nx;
          (*a)->nx=aux->nx;
          delete aux;
        }
  free(a);
  (*a)=NULL;
}


int main()
{ tip_nod *lista=NULL;
  int n=10,op=20,i;
    rand();
  for (;op>0;op--)
      { i=rand();    // 1=adaugare; 0=eliminare
        if ( (i%2) && (n) )
           { adaugare_dupa_el_x(&lista,rand()%100+1000);
             printf(" adaugare %d\n",lista->i);
             n--;
           }
           else
               if ( (i%2) && (!n) )
                  printf("Adaugare imposibila; lista plina\n");
        if ( (!i%2) && (n<10) )
           { printf(" eliminare %d\n",lista->nx->i);
             eliminare_dupa_el_x(&lista);
             n++;
           }
           else
               if ( (!i%2) && (n==10) )
                  printf("Eliminare imposibila; lista goala\n");
      }
  if (n==10)
     printf("Lista goala, deci nu au ramas comenzi\n");
     else
         { printf("Comenzile ramase se vor onora in curand...\n");
           for (n=0;n<45;n++)
               { printf(".");
                 Sleep(70);
               }
           printf("\n");
           list(lista->nx);
         }
  eliberare(&lista);
  list(lista);
  getch();
}
