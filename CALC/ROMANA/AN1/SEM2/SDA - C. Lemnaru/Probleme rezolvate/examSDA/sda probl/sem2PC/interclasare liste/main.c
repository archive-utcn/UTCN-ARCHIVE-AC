#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

typedef struct nod
{
    int info;
    struct nod *urm;
}Nod1,Nod2,Nod3;

void add1(Nod1 **prim1,Nod1 **ultim1,int nr1)
{
    Nod1 *p;

      p=(struct nod *)malloc(sizeof(struct nod));
      if((*prim1)==0)
        {
            (*prim1)=(*ultim1)=p;
            (*prim1)->info=nr1;
        }
      else
        {
            (*ultim1)->urm=p;
            (*ultim1)=p;
            (*ultim1)->info=nr1;
        }
      (*ultim1)->urm=0;
}

void add2(Nod2 **prim2,Nod2 **ultim2,int nr2)
{
    Nod2 *w;

      w=(struct nod *)malloc(sizeof(struct nod));
      if((*prim2)==0)
        {
            (*prim2)=(*ultim2)=w;
            (*prim2)->info=nr2;
        }
      else
        {
            (*ultim2)->urm=w;
            (*ultim2)=w;
            (*ultim2)->info=nr2;
        }
      (*ultim2)->urm=0;
}

void add3(Nod3 **prim3,Nod3 **ultim3,int nr3)
{
    Nod3 *p;

      p=(struct nod *)malloc(sizeof(struct nod));
      if((*prim3)==0)
        {
            (*prim3)=(*ultim3)=p;
            (*prim3)->info=nr3;
        }
      else
        {
            (*ultim3)->urm=p;
            (*ultim3)=p;
            (*ultim3)->info=nr3;
        }
      (*ultim3)->urm=0;
}


void afisare1(Nod1 *prim1)
{
    Nod1 *p;
    p=prim1;
     while(p!=0)
       {
           if(p==0) printf("Gol");
           else
             {
                 printf("%d  ",p->info);
                 p=p->urm;
             }
       }
}

void afisare2(Nod2 *prim2)
{
    Nod2 *p;
    p=prim2;
     while(p!=0)
       {
           if(p==0) printf("Gol");
           else
             {
                 printf("%d  ",p->info);
                 p=p->urm;
             }
       }
}

void afisare3(Nod3 *prim3)
{
    Nod3 *p;
    p=prim3;
     while(p!=0)
       {
           if(p==0) printf("Gol");
           else
             {
                 printf("%d  ",p->info);
                 p=p->urm;
             }
       }
}

void interclasare(Nod1 *prim1,Nod2 *prim2,Nod3 **prim3,Nod3 **ultim3)
{
    Nod1 *w;
    Nod2 *q;
    int nr;

    w=prim1; q=prim2;
     do
       {
          if((w->info)<=(q->info))
            {
                nr=w->info;
                w=w->urm;
            }
          else
            {
                nr=q->info;
                q=q->urm;
            }
          Nod3 *p;

      p=(struct nod *)malloc(sizeof(struct nod));
      if((*prim3)==0)
        {
            (*prim3)=(*ultim3)=p;
            (*prim3)->info=nr;
        }
      else
        {
            (*ultim3)->urm=p;
            (*ultim3)=p;
            (*ultim3)->info=nr;
        }
      (*ultim3)->urm=0;
       }while(w!=0 || q!=0);


}

int main()
{
    Nod1 *prim1=0,*ultim1=0;
    Nod2 *prim2=0,*ultim2=0;
    Nod3 *prim3=0,*ultim3=0;
    int nr1,nr2,a,i;
      printf("Dimensiunea: ");
        scanf("%d",&a);

      for(i=0;i<a;i++)
        {
          printf("info: ");
            scanf("%d",&nr1);
          add1(&prim1,&ultim1,nr1);
        }

      printf("Dimensiunea: ");
        scanf("%d",&a);

      for(i=0;i<a;i++)
        {
          printf("info: ");
            scanf("%d",&nr2);
          add2(&prim2,&ultim2,nr2);
        }

      afisare1(prim1);
      printf("\n");
      afisare2(prim2);
      interclasare(prim1,prim2,&prim3,&ultim3);
      printf("\n");
      afisare3(prim3);


  return 0;
}
