#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

typedef struct nod
{
    int info;
    struct nod *prec,*urm;
}Nod;

void add(Nod **prim,Nod **ultim,int nr,int *sum)
{
    Nod *p;
     p=(Nod *)malloc(sizeof(Nod));
      if((*prim)==0)
        {
            (*prim)=(*ultim)=p;
            p->prec=0;
            p->urm=0;
            p->info=nr;
        }
      else
        {
            (*ultim)->urm=p;
            p->prec=(*ultim);
            (*ultim)=p;
            p->info=nr;
        }
       *sum+=p->info;
       (*ultim)->urm=0;
}

void afisd(Nod *prim)
{
    Nod *p;
    p=prim;
     if(p==0) printf("\nLista goala");
     else
      {
          while(p!=0)
            {
                printf("%d  ",p->info);
                p=p->urm;
            }
      }
}

void afisi(Nod *ultim)
{
    Nod *p;
    p=ultim;
     if(p==0) printf("\nLista goala");
     else
      {
          while(p!=0)
            {
                printf("%d  ",p->info);
                p=p->prec;
            }
      }
}

void delp(Nod **prim)
{
  if((*prim)!=0)
    {
       (*prim)=(*prim)->urm;
       (*prim)->prec=0;
    }

}

void delu(Nod **ultim)
{
   if((*ultim)!=0)
    {
        (*ultim)=(*ultim)->prec;
        (*ultim)->urm=0;
    }
}

void delk(Nod **prim,Nod **ultim,int key)
{
    Nod *p,*q;
    p=(*prim);
    while(p!=0)
    {
     if(p->info==key)
       {
           if((*prim)==(*ultim))
              {
                  q=(*prim);
                  (*prim)=(*ultim)=0;
              }
           else
              {
                  if(p==(*prim))
                    {
                        q=(*prim);
                        (*prim)=(*prim)->urm;
                        (*prim)->prec=0;
                    }
                  else if(p==(*ultim))
                    {
                        q=(*ultim);
                        (*ultim)=(*ultim)->prec;
                        (*ultim)->urm=0;
                    }
                  else
                    {
                        q=p;
                        p->prec->urm=p->urm;
                        p->urm->prec=p->prec;
                    }
              }
       }
      p=p->urm;
    }
    free(q);
}

int main()
{
    Nod *prim=0,*ultim=0;
    int sum; sum=0;
    int a,i,nr,key;
     printf("Dim: ");
      scanf("%d",&a);
     for(i=0;i<a;i++)
       {
           printf("Info: ");
            scanf("%d",&nr);
           add(&prim,&ultim,nr,&sum);
       }
       printf("Suma= %d",sum);
      printf("\nAfisare directa: \n");
      afisd(prim);
      printf("\nAfisare inversa: \n");
      afisi(ultim);
      delp(&prim);
      printf("\nAfisare directa: \n");
      afisd(prim);
      delu(&ultim);
      printf("\nAfisare inversa: \n");
      afisi(ultim);
        printf("\n Cheia: ");
         scanf("%d",&key);
       delk(&prim,&ultim,key);
      printf("Afisare directa: \n");
      afisd(prim);
return 0;
}
