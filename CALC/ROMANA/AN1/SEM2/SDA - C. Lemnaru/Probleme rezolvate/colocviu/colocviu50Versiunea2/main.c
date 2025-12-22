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

typedef int arr[50][50];
typedef int vec[50];

int b,bmin,i,n,j,k,l,lo;
int a[50], gr[50], succesor[50]; //in a se retine lungimea fiecarui cuvant
vec randuri;                     //in gr se retine 'gradul de uratenie' daca un cuvant este pe prima linie
arr dist1, dist;                 //matricile sunt folosite pentru a retine spatiile dintre cuvinte


void citire()
{
   int i;
   printf("Lungimea liniei: "); scanf("%d",&l);
   printf("Lungimea ideala a spatiului: "); scanf("%d",&b);
   bmin=1;        //nr minim de spatii dintre doua cuvinte
   printf("Nr de cuvinte: ");scanf("%d",&n);
   printf("Introduceti %d cuvinte: \n",n);
   for (i=1;i<=n;i++)
   {
       scanf("%s",cuv[i].d);
       a[i]=strlen(cuv[i].d);  //se adauga lunigmea fiecarui cuvant in vectorul a
       succesor[i]=i;
   }
}

void grad(int i, int j, int poz)      //se calculeaza 'gradul de uratenie'
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

void cuvant(int i, int j, int lo)  //muta cuvantul pe linie sa vada daca se poate gasi un 'grad de uratenie mai bun'
{
   int k;
   if (((lo+bmin+a[j])<=l) && (j<=n)) //verifica daca inca mai sunt spatii unde poate fi mutat cuvantul pe o anumita linie
      for (k=lo+bmin;k<=l-a[j];k++)
           {
              dist[i][j-i]=k-lo;
              randuri[i]=1+randuri[j+1];
              grad(i,j,k);
              cuvant(i,j+1,k+a[j]);
           }
}

int main()
{
    citire();
    gr[n]=0; //gradul ultimul cuvant este 0 pentru ca ar fi singur pe linie
    gr[n+1]=0;
    randuri[n]=1; //la inceput ultimul cuvant se pune pe primul rand
    randuri[n+1]=0;
    for (i=n-1;i>=1;i--)
        {
           lo=a[i];
           randuri[i]=1+randuri[i+1];
           gr[i]=l-lo+gr[i+1];
           cuvant(i,i+1,a[i]);
        }
  i=1; k=1;
  while (i<=n)
  {
    printf("randul %d\n",k);
    printf("de la cuvantul %d la cuvantul %d separate prin ",i,succesor[i]);
    if (succesor[i]-i==0) printf("0"); //se verifica daca ultimul cuvant este singur pe ultima linie
    for(j=1;j<=succesor[i]-i;j++)
      printf("%d ",dist1[i][j]);
      i=succesor[i]+1;
      k=k+1;
      printf("\n");
  }
  printf("\n");
  printf("Gradul de uratenie este: %d",gr[1]);
    return 0;
}

