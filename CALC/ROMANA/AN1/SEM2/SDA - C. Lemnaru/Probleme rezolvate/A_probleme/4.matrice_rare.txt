// Program l1_3_8.cpp
// Matrice rare - operatii (suma si produs)

#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

typedef struct TIP_NOD { int lin;
                            int col;
                         float val;
			 TIP_NOD *nx;
		       } ;

void adaugare_inceput_lista(TIP_NOD **pl,int l, int c, int v)
{ TIP_NOD *p=(TIP_NOD*) malloc(sizeof(TIP_NOD));
  p->lin=l;
  p->col=c;
  p->val=v;
  p->nx=(*pl);
  (*pl)=p;
}

TIP_NOD* cauta_el_i(TIP_NOD *a, int i)
{ while (a)
        { if (a->lin==i)
             return a;
          a=a->nx;
        }
  return NULL;
}

TIP_NOD* cauta_el_i_j(TIP_NOD *a, int i, int j)
{ while (a)
        { if ( (a->lin==i) && (a->col==j) )
             return a;
          a=a->nx;
        }
  return 0;
}

TIP_NOD* adunare_a_b(TIP_NOD *a, TIP_NOD *b)
{ TIP_NOD *aux,*aa,*c=NULL;
  while (a)
        { adaugare_inceput_lista(&c,a->lin,a->col,(int)a->val);
          a=a->nx;
        }
  while (b)
        { aux=c;
          aux=cauta_el_i_j(c,b->lin,b->col);
          if ( (!aux) )
	     adaugare_inceput_lista(&c,b->lin,b->col,(int)b->val);
             else
                 aux->val+=b->val;
          b=b->nx;
        }
  aux=c;
  while (aux->val==0)
        { c=c->nx;
          free(aux);
          aux=c;
        }
  while (aux->nx)
        { if (aux->nx->val==0)
             { aa=aux->nx;
               aux->nx=aa->nx;
               free(aa);
             }
          aux=aux->nx;
        }
  return c;
}

TIP_NOD* inmultzire_a_b(int n1,int m1, int n2, int m2, TIP_NOD *a, TIP_NOD *b)
{ TIP_NOD *aux1,*aux2,*c=NULL;
  int i=1,j;
  float s;
  for (;i<=n1;i++)
      { for (j=1;j<=m2;j++)
            { s=0;
              if ( (aux1=cauta_el_i(a,i)) )
                 if ( (aux2=cauta_el_i_j(b,aux1->col,j)) )
                    s+=aux1->val*aux2->val;
              while ( (aux1=cauta_el_i(aux1->nx,i)) )
                    if ( (aux2=cauta_el_i_j(b,aux1->col,j)) )
                       s+=aux1->val*aux2->val;
              if (s)
                 adaugare_inceput_lista(&c,i,j,(int)s);
            }
      }
  return c;
}

void tiparire(int n, int m, TIP_NOD *a)
{ int i=1,j;
  TIP_NOD *aux;
  for (;i<=n;i++)
      { for (j=1;j<=m;j++)
            if ( (aux=cauta_el_i_j(a,i,j)) )
               printf("%4.2f",aux->val);
               else
                   printf("%4d",0);
        printf("\n");
      }
}

void eliberare(TIP_NOD **p)
{ TIP_NOD *aux;
  while (*p)
        { aux=(*p);
          (*p)=(*p)->nx;
          free(aux);
        }
}

int main()
{ FILE *f;
  TIP_NOD *a=NULL,*b=NULL,*c=NULL,*d=NULL;
  int n1,n2,m1,m2,i=0,enn1,enn2,li,co;
  int va;

  if ( (f=fopen("date.txt","rt"))==NULL )
     { printf("ERROR");
       getch();
       exit(100);
     }
  fscanf(f,"%d %d %d",&n1,&m1,&enn1);
  for (;i<enn1;i++)
      { fscanf(f,"%d %d %d",&li,&co,&va);
        adaugare_inceput_lista(&a,li,co,va);
      }
  fscanf(f,"%d %d %d",&n2,&m2,&enn2);
  for (i=0;i<enn2;i++)
      { fscanf(f,"%d %d %d",&li,&co,&va);
        adaugare_inceput_lista(&b,li,co,va);
      }
  printf("Lista 'a' este:\n");
  tiparire(n1,m1,a);
  getch();
  printf("Lista 'b' este:\n");
  tiparire(n2,m2,b);
  getch();
  if ( (n1==n2) && (m1==m2) )
     { c=adunare_a_b(a,b);
       printf("Suma este:\n");
       tiparire(n1,m1,c);
       getch();
     }
     else
         printf("\nMatricile nu se pot aduna (n-au aceleasi dimensiuni\n");

  printf("\nProdusul este:\n");
  if (m1==n2)
     { d=inmultzire_a_b(n1,m1,n2,m2,a,b);
       tiparire(n1,m2,d);
     }
     else
         printf("\nMatricile nu se pot inmulti linii prin coloane (m1<>n2)\n");
  eliberare(&a);
  if (a)
     tiparire(n1,m1,a);
     else
         printf("\n  Lista 'a' este goala");
  eliberare(&b);
  if (b)
     tiparire(n2,m2,b);
     else
         printf("\n  Lista 'b' este goala");
  eliberare(&c);
  if (c)
     tiparire(n1,m1,c);
     else
         printf("\n  Lista 'c' este goala");
  eliberare(&d);
  if (d)
     tiparire(n1,m2,d);
     else
         printf("\n  Lista 'd' este goala");
  getch();
}
