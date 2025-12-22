/*50. Se considera urmatoarea problema de formatare a textului unui paragraf, care este o secventa de n
cuvinte, c1, c2, ..., cn, de lungimi a1, a2, ..., an, care trebuie afisate pe linii de lungime L. Cuvintele trebuie
separate prin spatii, a caror lungime ideala este b, dar spatiile pot fi extinse sau comprimate (dupa
comprimare trebuie sa ramâna totusi > 0), astfel încât o linie ce contine cuvintele ci ci+1 ... cj sa ocupe
exact lungimea L. Pentru fiecare spatiu b' care este este mai mare sau mai mic decât lungimea ideala b, se
defineste un "grad de urâtenie" ca fiind |b' - b|. Pentru întregul paragraf, este de dorit ca suma acestor
grade de urâtenie sa fie minim. Se cere sa se scrie programul care determina valorile lungimilor spatiilor
separatoare astfel încât sa se obtina o formatare cât mai estetica a textului.*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct
{
    char d[50];
} cuvant1;

cuvant1 cuv[50];

int b,bmin,i,n,j,k,l,lo;
int a[50], gr[50], succesor[50], randuri[50];
int dist1[50][50], dist[50][50];

void citire()
{
   int i;
   printf("Lungimea liniei: "); scanf("%d",&l);
   printf("Lungimea ideala a spatiului: "); scanf("%d",&b);
   bmin=1; //nr minim de spatii dintre doua cuvinte
   printf("Nr de cuvinte: ");scanf("%d",&n);
   printf("Introduceti %d cuvinte \n",n);
   for (i=1;i<=n;i++)
   {
       scanf("%s",(cuv[i].d));
       a[i]=strlen(cuv[i].d);
       succesor[i]=i;
   }
}

void grad(int i, int j, int poz, int dist[50][50], int randuri[])
{
   int k,c;
   c=0;
   for(k=1;k<=j-i;k++) c=c+abs(dist[i][k]-b);
   if (randuri[i]!=1) c=c+gr[j+1]+l-poz-a[j];
   if (c<gr[i])
     {
        gr[i]=c;
        memcpy(dist1,dist,sizeof(dist));
        succesor[i]=j;
     }
}

void cuvant(int i, int j, int lo, int dist[50][50], int randuri[])
{
   int k;
   if (((lo+bmin+a[j])<=l) && (j<=n))
       for (k=lo+bmin;k<=l-a[j];k++)
           {
              dist[i][j-i]=k-lo;
              randuri[i]=1+randuri[j+1];
              grad(i,j,k,dist,randuri);
              cuvant(i,j+1,k+a[j],dist,randuri);
           }
}

int main()
{
    citire();
   int p,aux;
    gr[n]=0; gr[n+1]=0;
    randuri[n]=1; randuri[n+1]=0;
    aux=0;
    for (i=n-1;i>=1;i--)
        {
           for(p=1;p<=n;p++)
             printf("%d ",randuri[p]);
             printf("\n");
           lo=a[i];
           randuri[i]=1+randuri[i+1];
           gr[i]=l-lo+gr[i+1];
           cuvant(i,i+1,a[i],dist1,randuri);
        }

  do
  {
    printf("randul %d\n",k);
    printf("de la cuvantul %d la cuvantul %d separate prin  ",i,succesor[i]);
    for(j=1;j<=succesor[i]-i;j++)
      printf("%d",dist1[i][j]);
      i=succesor[i]+1;
      k=k+1;
      printf("\n");
  } while (i>n);
  printf("\n"); printf("\n");
  printf("Gradul de uratenie este: %d",gr[1]);
    for(i=1;i<=n;i++)
       printf("%s ",cuv[i].d);
    for(i=1;i<=n;i++)
       printf("%d",a[i]);

    return 0;
}

