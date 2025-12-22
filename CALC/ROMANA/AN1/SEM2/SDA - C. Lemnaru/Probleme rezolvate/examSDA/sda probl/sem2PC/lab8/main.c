//GRAFURI
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

typedef struct nod
{
    int info;
    struct nod *urm;
}Nod;

void adauga(Nod **prim,Nod **ultim,int nr)
{
    Nod *p;
    p=(struct nod *)malloc(sizeof(struct nod));
    if(*prim==0)
      {
        (*prim)=(*ultim)=p;
        (*prim)->info=nr;
      }
     else
      {
        (*ultim)->urm=p;
        (*ultim)=p;
        (*ultim)->info=nr;
      }
     (*ultim)->urm=0;
}

void afisare(Nod *prim)
{
    Nod *p=prim;
    if(p==0) printf("Lista Vida");
    else
      {
        while(p!=0)
         {
           printf("%d   ",p->info);
           p=p->urm;
         }
      }
}

int extragere(Nod **prim,Nod **ultim,int *nr)
{
    if((*prim)==0) return 0;
    *nr=(*nr)+(*prim)->info;
    Nod *p=(*prim);
    (*prim)=(*prim)->urm;
    free(p);
    if((*prim)==0) *ultim=0;
   return 1;
}

/*void  explorare_largime(int s)
 s este nodul de pornire
   {
       int vizitate[50];
       Nod *prim=0,*ultim=0;
       int i,NrNoduri,v,w;
       for(i=0;i<NrNoduri;i++)
            vizitate[i]=0;     iniţializare vector cu zero
       vizitate[s]=1;se vizitează  nodul s
       printf("");
       adauga(&prim,&ultim,s);
       while(prim!=0)
            {
                extragere(&prim,&ultim,&s);
//                for(fiecare nod w adiacent lui v)
                      if(vizitate[w]==0)
                             {
                                  vizitate[w]=1;
                                  printf("\n %d ",w);
                                  adauga(&prim,&ultim,w);
                              }
             }
    }
*/


int main()
{
    int *nr,i,a=0;
    Nod *prim=0,*ultim=0;
    adauga(&prim,&ultim,3);
    adauga(&prim,&ultim,1);
    adauga(&prim,&ultim,2);
    adauga(&prim,&ultim,8);
    afisare(prim);
    printf("\n\n");
     //printf("Extrage: ");
      //scanf("%d",&a);
    for(i=0;i<4;i++)
      {
        extragere(&prim,&ultim,&nr);
    // sterge(&prim,&ultim,&a);
     afisare(prim);
     printf("\n");

      }
     printf("\n\n%d",nr);
     return 0;
}
