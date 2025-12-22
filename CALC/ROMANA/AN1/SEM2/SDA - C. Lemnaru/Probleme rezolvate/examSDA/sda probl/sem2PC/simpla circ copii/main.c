#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>

typedef struct nod
{
    char nume[10];
    struct nod *urm;
}Nod;

void add(Nod **prim,Nod **ultim,char cop[])
{
    Nod *p;
     p=(Nod *)malloc(sizeof(Nod));
     if((*prim)==0)
       {
           (*prim)=(*ultim)=p;
           strcpy((*prim)->nume,cop);
       }
     else
       {

           (*ultim)->urm=p;
           (*ultim)=p;
           strcpy((*ultim)->nume,cop);
       }
     (*ultim)->urm=(*prim);
}

void afisare(Nod *prim)
{
    Nod *p;
    p=prim;
     do{
         if(p==0) printf("Finish");
         else
          {
             printf("%s ",p->nume);
             p=p->urm;
          }

     }while(p!=prim);
}

void joc(Nod **prim,Nod **ultim,Nod *p)
{
    Nod *q,*w,*r;
    q=(*prim);
    w=(*prim)->urm;
     do
          {
               if(p==(*prim))
                 {
                     if((*prim)==(*ultim))
                       {
                           r=(*prim);

                           (*prim)=(*ultim)=0;


                       }
                     else
                       {
                           r=(*prim);
                           (*prim)=(*prim)->urm;
                           (*ultim)->urm=(*prim);
                       }
                 }
               else if(p==w)
                 {
                     if(w==(*ultim))
                       {
                         r=(*ultim);
                         q->urm=(*ultim)->urm;
                         (*ultim)=q;
                       }
                      else
                       {
                          r=w;
                          q->urm=w->urm;
                       }
                 }
           q=w;
           w=w->urm;
        }while(w!=(*prim) && (*prim)!=0);
     free(r);
}

int main()
{
    Nod *prim=0,*ultim=0,*p=0;;
    char cop[10],c[10];
    int i,nr,k=0,ok=0,x=0;
     printf("Nr: ");
      scanf("%d",&nr);
     for(i=0;i<nr;i++)
       {
           printf("Nume: ");
            scanf("%s",cop);
           add(&prim,&ultim,cop);
       }
      afisare(prim);
      p=prim;
       printf("\n\nSe incepe cu copilul: ");
        scanf("%s",c);
       while(ok!=1)
         {
             if(strcmp(p->nume,c)==0)
               ok=1;
             else p=p->urm;
         }
        printf("\nAl catelea copil iasa? ");
         scanf("%d",&x);

       while(p!=0)
         {
             if(k==x)
              {
                 joc(&prim,&ultim,p);
                 printf("\n");
                 afisare(prim);
                 k=0;
                  if(prim==0)  exit(0);
              }

                 k++;
                 p=p->urm;

         }

   return 0;
}
