// Program l1_3_9.cpp
// Polinoame - operatii (suma, diferenta, produs si impartire)

#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

typedef struct TIP_NOD {
    int grad;
			 float coef;
			 struct TIP_NOD *nx;
		       }TIP_NOD ;

void adaugare_inceput_lista(TIP_NOD **pl,int gr, float c)
{ TIP_NOD *p=(TIP_NOD*) malloc(sizeof(TIP_NOD));
  p->grad=gr;
  p->coef=c;
  p->nx=(*pl);
  (*pl)=p;
}

void adaugare_poz_oarecare_lista(TIP_NOD *pl,int gr, float c)
{ TIP_NOD *p=(TIP_NOD*) malloc(sizeof(TIP_NOD));
  p->grad=gr;
  p->coef=c;
  p->nx=pl->nx;
  pl->nx=p;
}

void list(TIP_NOD *p)
{ while (p)
        { if (p->nx)
             if (p->nx->coef>=0)
                printf("%.3f*X^%d+",p->coef,p->grad);
                else
                    printf("%.3f*X^%d",p->coef,p->grad);
             else
                 if (p->grad)
                    printf("%.3f*X^%d",p->coef,p->grad);
                    else
                        printf("%.3f  %.3d",p->coef,p->grad);
          p=p->nx;
        }
}

TIP_NOD* cauta_el_i(TIP_NOD *a, int i)
{ while (a->nx)
        { if (a->nx->grad==i)
             return a;
          a=a->nx;
        }
  return NULL;
}

TIP_NOD* adunare_a_b(TIP_NOD *a, TIP_NOD *b)
{ TIP_NOD *aux,*aux2,*c=NULL;
  adaugare_inceput_lista(&c,a->grad,a->coef);
  aux=c;
  a=a->nx;
  while (a)
        { adaugare_poz_oarecare_lista(aux,a->grad,a->coef);     //   c=a
          a=a->nx;
          aux=aux->nx;
        }
  while (b->grad>=c->grad)
        if (b->grad>c->grad)
           { adaugare_inceput_lista(&c,b->grad,b->coef);
             b=b->nx;
           }
           else
               if (b->grad==c->grad)
                  { c->coef+=b->coef;
                    if (!c->coef)
                       { aux=c;
                         c=c->nx;
                         free(aux);
                       }
                    b=b->nx;
                  }
  while (b)
        { aux=cauta_el_i(c,b->grad);
          if (aux)
             { aux->nx->coef+=b->coef;
               if (!aux->nx->coef)
                  { aux2=aux->nx;
                    aux->nx=aux2->nx;
                    free(aux2);
                  }
             }
             else
                 { aux=c;
                   while ( (b->grad<aux->nx->grad) && (aux->nx) )
                         aux=aux->nx;
                   adaugare_poz_oarecare_lista(aux,b->grad,b->coef);
                 }
          b=b->nx;
        }
  return c;
}

TIP_NOD* scadere_a_b(TIP_NOD *a, TIP_NOD *b)
{ TIP_NOD *aux,*c=NULL;
  adaugare_inceput_lista(&c,b->grad,-b->coef);
  aux=c;
  b=b->nx;
  while (b)
        { adaugare_poz_oarecare_lista(aux,b->grad,-b->coef);     //   c=a
          b=b->nx;
          aux=aux->nx;
        }
  c=adunare_a_b(c,a);
  return c;
}

TIP_NOD* inmultire_a_b(TIP_NOD *a, TIP_NOD *b)
{ TIP_NOD *aux,*aux2,*aa=b,*c=NULL;
  adaugare_inceput_lista(&c,a->grad+b->grad,a->coef*b->coef);
  b=b->nx;
  while (a)
        { while (b)
                { aux=cauta_el_i(c,a->grad+b->grad);
                  if (aux)
                     { aux->nx->coef+=a->coef*b->coef;
                       if (!aux->nx->coef)
                          { aux2=aux->nx;
                            aux->nx=aux2->nx;
                            free(aux2);
                          }
                     }
                     else
                         { aux=c;
                           while ( ((a->grad+b->grad)<aux->nx->grad) && (aux->nx) )
                                 aux=aux->nx;
                           adaugare_poz_oarecare_lista(aux,a->grad+b->grad,a->coef*b->coef);
                         }
                  b=b->nx;
                }
          b=aa;
          a=a->nx;
        }
  return c;
}

TIP_NOD* impartire_a_b(TIP_NOD *a, TIP_NOD *b, TIP_NOD **r)
{ TIP_NOD  *aux, *c;
  *r=NULL;
  if (a->grad<b->grad)
     { c=(TIP_NOD*) malloc(sizeof(TIP_NOD));
       c->coef=0;
       c->grad=0;
       c->nx=NULL;
       (*r)=NULL;
       adaugare_inceput_lista(r,a->grad,a->coef);
       a=a->nx;
       while (a)
             { adaugare_poz_oarecare_lista(*r,a->grad,a->coef);
               a=a->nx;
             }
     }
     else
        { adaugare_inceput_lista(&c,a->grad-b->grad,a->coef/b->coef);
          (*r)=scadere_a_b(a,inmultire_a_b(b,c));
          aux=c;
          while ((*r)->grad>=b->grad)
                { adaugare_poz_oarecare_lista(aux,(*r)->grad-b->grad,(*r)->coef/b->coef);
                  aux=aux->nx;
                  (*r)=scadere_a_b((*r),inmultire_a_b(b,aux));
                }
        }
  return c;
}

int main()
{ FILE *g;
  TIP_NOD *a=NULL,*b=NULL,*c=NULL,*d=NULL,*e=NULL,*f=NULL,*r=NULL;
  int n,m,gra;
  float co;
  if ( (g=fopen("date.txt","rt"))==NULL )
     { printf("ERROR");
       getch();
       exit(100);
     }
  fscanf(g,"%d",&n);
  fscanf(g,"%d %f",&gra,&co);
  while ( (gra!=n) && (!feof(g)) )
      { adaugare_inceput_lista(&a,gra,co);
        fscanf(g,"%d %f",&gra,&co);
      }
  adaugare_inceput_lista(&a,gra,co);
  fscanf(g,"%d",&m);
  fscanf(g,"%d %f",&gra,&co);
  while ( (gra!=m) && (!feof(g)) )
      { adaugare_inceput_lista(&b,gra,co);
        fscanf(g,"%d %f",&gra,&co);
      }
  adaugare_inceput_lista(&b,gra,co);
  printf("P(X)=");
  list(a);
  printf("\nQ(X)=");
  list(b);
  c=adunare_a_b(a,b);
  printf("\nP(X)+Q(X)=");
  list(c);
  c=adunare_a_b(b,a);
  printf("\nQ(X)+P(X)=");
  list(c);
  d=scadere_a_b(a,b);
  printf("\nP(X)-Q(X)=");
  list(d);
  d=scadere_a_b(b,a);
  printf("\nQ(X)-P(X)=");
  list(d);
  e=inmultire_a_b(a,b);
  printf("\nP(X)*Q(X)=");
  list(e);
  e=inmultire_a_b(b,a);
  printf("\nQ(X)*P(X)=");
  list(e);
  f=impartire_a_b(a,b,&r);
  printf("\nP(X)/Q(X)   =>  C(X)=");
  list(f);
  printf(";  R(X)=");
  list(r);
  f=impartire_a_b(b,a,&r);
  printf("\nQ(X)/P(X)   =>  C(X)=");
  list(f);
  printf(";  R(X)=");
  list(r);
  getchar();
  return 0;
}
