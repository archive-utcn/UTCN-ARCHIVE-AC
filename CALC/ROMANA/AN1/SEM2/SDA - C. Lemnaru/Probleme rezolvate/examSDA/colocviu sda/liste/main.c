#include<stdlib.h>
#include<stdio.h>
#include <conio.h>

struct nod{
        char cuv[20];
        struct nod *urm;
        };
struct nod *prim,*ultim,*p,*q;
void creare (struct nod **prim,char cuv[])
    {
        struct nod *p;
        p=(struct nod*)malloc(sizeof(struct nod));
        if (p==NULL)
        {
            printf("memoria este goala");
            return 0;
        }
        else  {
        strcpy(p->cuv,cuv);
        if ((*prim)==0) {(*prim)=p; p->urm=0;}
        else { p->urm=(*prim);
               (*prim)=p;
            }
 }   }
void afisare()
{
    p=prim;
    while(p!=NULL)
    {
        printf("%5s",p->cuv);
        p=p->urm;
    }
}
int main()
{
    int n,i;
    char sir[20];
    struct nod *p=NULL;
    printf("dati val lui n");
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {
        scanf("%s",&sir);
        creare(&prim,sir);
    }
    printf("\n");
    afisare();
    p=prim;
    q=p->urm;
    return 0;
}
