/*8. Sa se simuleze urmatorul joc: n copii, ale caror nume se citesc de la tastatura, stau în cerc. Începând cu un
anumit copil (numele sau se citeste), se numara copiii în sensul acelor de ceasornic. Fiecare al m-lea copil
(m se citeste) iese din joc. Numaratoarea continua începând cu urmatorul copil din cerc. Câstiga jocul
ultimul copil ramas în cerc.*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct noduri{
               char nume[20];
               struct noduri *urm;
}nod;

nod *pnod;///pointer global pt acces la lista

void afisare()
{
    ///afisarea listei
  nod *q;
  q=pnod;
  printf("\n~~~~~~~~~KidS~~~~~~~~~\n");
  do
  {
    printf("\n%s",q->nume);
    q=q->urm;
  }
  while (q!=pnod);
}

nod *cautare(char key[])
{
    ///cautarea copilului cu care se incepe jocul
    nod *p;
    p=pnod;
    do
    {
        if(strcmp(key,p->nume)==0)
        return p;
        p=p->urm;
    }while(p!=pnod);
    return NULL;
}

void stergere(nod *p,int n)
{
    ///functia scoate din joc fiecare al n-lea copil
    int i;
    nod *q,*q1;
    q=p;
    do
    {
        for(i=2;i<=n;i++)
        {
        ///se cauta al n-lea copil
        q1=q;
        q=q->urm;
        }
        ///este scos din joc, dar mai intai afisat
        printf("\nOut: %s",q->nume);
        q1->urm=q->urm;
        free(q);
        q=q1->urm;
    }
    while (q!=q->urm);///jocul se termina cand mai ramane un singur copil
    printf("\nWinner %s\n",q->nume);
}


int main(void)
{
    int i,n,m;
    char s[20];
    nod *q,*p;
    ///citim nr de copii
    printf("Input nb of kids: ");
    scanf("%d",&n);
    pnod=NULL;///initializarea pointerului de citire
    for(i=0;i<n;i++)
    {
     printf("Input kid nb %d: ",i+1);
     scanf("%s",s);///citirea numelui copilului
     if (pnod==NULL)
     {
         pnod=(nod*)malloc(sizeof(nod));///citirea de date in primul nod
         strcpy(pnod->nume,s); pnod->urm=pnod;
     }
    else
    {
        q=(nod*)malloc(sizeof(nod));
        strcpy(q->nume,s);
        q->urm=pnod->urm;
        pnod->urm=q;
        pnod=q;///q se adauga la lista
    }
    }
    afisare();
    do{
        printf("\nKid that starts the game: ");
        scanf("%s",s);
        p=cautare(s);
        if(p==NULL)
        {
            printf("\nNot found!!!");
        }
    }while(p==NULL);
    printf("Input m: ");
    fflush(stdin);
    scanf("%d",&m);
    stergere(p,m);
    return 0;
}
