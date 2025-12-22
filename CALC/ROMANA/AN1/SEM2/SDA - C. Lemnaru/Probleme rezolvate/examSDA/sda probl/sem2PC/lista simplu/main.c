#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

struct nod
{
    int info;
    char cuv[20];
    struct nod *urm;
};

struct nod *prim,*ultim,*aux,*p,*q;

int creare(int nr,char sir[])
{
    if(p==NULL)
    {
        p=(struct nod *)malloc(sizeof(struct nod));
         if(p==NULL)
         {
             printf("RAM plin!!!");
             exit(0);
         }
        prim=p;
        ultim=p;
        p->info=nr;
        strcpy(p->cuv,sir);
        ultim->urm=0;
    }

    else
    {

        p=(struct nod *)malloc(sizeof(struct nod));
        if(p==NULL)
         {
             printf("RAM plin!!!");
             exit(0);
         }
        ultim->urm=p;
        ultim=p;
        p->info=nr;
        strcpy(p->cuv,sir);
        ultim->urm=0;
    }
    return (p);
}

void afisare()
{
   p=prim;
    while(p!=0)
      {
          printf("%3d  %5s\n",p->info,p->cuv);
          p=p->urm;
      }
}

void sortare(int n)
{

    int i,j;

     while(p!=0)
       {
           if((p->info) > (q->info))
            {
                aux=p;
                p=q;
                q=aux;
                q=q->urm;
            }
           else p=p->urm;
       }

}

int main()
{
    int n,nr,i;
    char sir[20];
    struct nod *p=NULL;
    printf("Nr de noduri: ");
     scanf("%d",&n);

   for(i=0;i<n;i++)
      {
         printf("Int info: nr + cuv \n  ");
          scanf("%d %s",&nr,&sir);
         p=creare(nr,sir);
      }
    printf("\n");
    afisare();
    printf("\n");
    p=prim;
    q=p->urm;
    sortare(n);
    afisare();

  return(0);
}
