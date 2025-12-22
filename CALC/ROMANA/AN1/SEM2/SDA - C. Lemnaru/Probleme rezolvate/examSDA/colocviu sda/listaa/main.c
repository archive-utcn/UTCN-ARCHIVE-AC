#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

struct nod{
            struct nod *urm;
            char cuv[20];
            };
struct nod *prim=NULL,*ultim=NULL;

void creare(char cuv[])
{
    struct nod *p;
    p=(struct nod *)malloc(sizeof(struct nod));
    if (p==NULL)
    {
        printf("nu s-a alocat memorie in heap");
    }
    else
    {
        strcpy(p->cuv,cuv);
        p->urm=NULL;
        if (prim==NULL)
        {
            prim=p;
            ultim=p;
        }
        else
        {
            ultim->urm=p;
            ultim=p;
        }
    }
}
int cautare(char key[])
{
   struct nod *p;
    p=prim;
    while(p!=NULL)
    {
        if (p->cuv==key)
            {return p;
              printf("s-a gasit cheia");}
            else
       {
        p=p->urm;
       }

    };
return 0;
}
void afisare()
{
    struct nod *p;
    p=prim;
    while (p!=NULL)
    {
        printf("%s ",p->cuv);
        p=p->urm;
    };
}

void main()
{
    struct nod *p;
    int n,i;
    char cuv[20];
    char key[20];
    printf("dati nr de cuvinte:");
    scanf("%d",&n);
    printf("Dati cheia:");
    scanf("%s",key);
    for (i=0;i<n;i++)
    {
    scanf("%s",cuv);
    creare(cuv);
    }
    cautare(key);

    afisare();
    return 0;
}





