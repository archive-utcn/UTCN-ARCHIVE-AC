#include <stdio.h>
#include <stdlib.h>
#include<string.h>
struct nod { char cuv[15];
            int fr;
            struct nod *urm;
            struct nod *prec;
            };
struct nod *prim=NULL,*ultim=NULL;
void adaugare (struct nod **prim,struct nod **ultim,struct nod *p)
    {
        if (*prim==NULL)
            {
                *prim=p;
                *ultim=p;
                p->urm=NULL;
                p->prec=NULL;
            }
        else { int inserat=0;
               struct nod *q;
               q=*prim;
               while ( (q!=NULL)  && (inserat==0) )
                {
                    if (strcmp(q->cuv,p->cuv)==0)
                        {
                            q->fr++;
                            free(p);
                            inserat=1;
                        }
                q=q->urm;
                }
            q=*prim;
            while ( (q!=NULL)  && (inserat==0) )
                {
                    if (strcmp(q->cuv,p->cuv)>0)
                        {
                            if (q==(*prim))
                                {
                                    p->urm=(*prim);
                                    p->prec=NULL;
                                    (*prim)=p;
                                    inserat=1;
                                }
                            else
                                  {
                                      if(q->urm!=NULL)
                                        {
                                          q=q->urm;
                                          struct nod *q1;
                                          if (strcmp(q->cuv,p->cuv)>0)
                                                {
                                                    q1=q;
                                                    q=q->urm;
                                                    q1->urm=p;
                                                    p->prec=q1;
                                                    p->urm=q;
                                                    q->prec=p;
                                                    inserat=1;
                                                }
                                        }

                                  }
                        }
                if (q!=NULL)
                q=q->urm;
                }
            if (inserat==0) { p->urm=0; p->prec=(*ultim); (*ultim)->urm=p;
                            (*ultim)=p;
                            }

             }

    }

int main()
{ int n;
 printf("\nIntroduceti numarul de cuvinte:");
 scanf("%d",&n);
 char cuv[15];
 int i;
 struct nod *p;
 for (i=0;i<n;i++)
    {
        p=(struct nod*)malloc(sizeof(struct nod));
        fflush(stdin);
        gets(cuv);
        strcpy(p->cuv,cuv);
        p->fr=1;
    adaugare(&prim,&ultim,p);
    }
   struct nod *q;
   q=prim;
   while (q!=NULL)
            {
                printf("%s  %d\n",q->cuv,q->fr);
                q=q->urm;
            }
        return 0;
}

