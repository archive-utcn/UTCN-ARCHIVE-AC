/*
39. Se dau doua numere naturale A si B si un vector v care contine n numere naturale. Sa se determine daca
se poate trece din A în B, stiind ca singurele operatii permise sunt:
a) Adunarea la A a oricâte numere din vectorul v;
a) Scaderea din A a oricâte numere din vectorul v.
Fiecare numar poate fi adunat, respectiv scazut de mai multe ori.
Daca raspunsul la întrebare este afirmativ, se cere numarul minim de operatii prin care se poate
trece din A în B.
*/

#include <stdio.h>
#include <stdlib.h>
int st[100],n,s=0,suma,este=0,as,a[100],ev,v[100],min=32000,A,B;

void init(int k)
{if(k==1) st[k]=0;
 else st[k]=st[k-1]-1;}


int succesor(int k)
{if(st[k]<n) {st[k]=st[k]+1; return 1;}
 else {s=s-a[st[k-1]];return 0;}
    }
int valid(int k)
{if(s+a[st[k]]<=suma){s=s+a[st[k]]; return 1;}
  else return 0;
    }
int solutie(int k)
{return s==suma;
    }
void tipar(int k)
{int i,j,p,w=0;
este=1;

for(i=1;i<=n;i++)
    {for(j=1,p=0;j<=k;j++)
    if(i==st[j]) p++;
    // printf("%d *",p);
    // printf("%d ",a[i]);
     w=w+p;}
//printf(" \n%d\n",w);
if(w<min){for(i=1;i<=n;i++)
    {for(j=1,p=0;j<=k;j++)
    if(i==st[j]) p++;
    v[i*2]=p;v[i*2+1]=a[i];}
    min=w;}
//printf("\n");

s=s-a[st[k]];
}

void bt(int k)
{init(k);
while(succesor(k))
    if(valid(k))
      {if(solutie(k)) tipar(k);
      else bt(k+1);}
    }

int main()
{int i,j;
    printf("n: ");scanf("%d",&n);
printf("Vectorul cu n numere naturale: ");
for(i=1;i<=n;i++)
{scanf("%d",&a[i]);
    }
printf("A:");
scanf("%d",&A);
printf("B:");
scanf("%d",&B);
if(A<B)suma=B-A;
else suma=A-B;
bt(1);
if(este==0) printf("Imposibil de rezolvat");
else {if(A<B){printf("%d",A);
         for(i=1;i<=n;i++)
                for(j=1;j<=v[i*2];j++)
                printf("+%d",v[i*2+1]);
            printf("=%d",B);
             }
    else{ printf("%d",A);
        for(i=1;i<=n;i++)
            for(j=1;j<=v[i*2];j++)
                printf("-%d",v[i*2+1]);
        printf("=%d",B);
    }
}
    return 0;
}
