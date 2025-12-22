/* Sa se introduca tipul RATIONAL ca o structura formata din numarator si numitor. Sa se scrie
functii de simplificare, adunare, scadere, înmultire, împartire, ridicare la putere.*/
#include <stdio.h>
#include <stdlib.h>

struct rational
{
    int numarator;
    int numitor;
};
struct rational p,q;

int cmmdc(int a, int b)
{
    int c;
    if (a<b)
    {
        c=a;
        a=b;
        b=c;
    }
    while (b)
    {
        c = a % b;
        a = b;
        b = c;
    }
    return a;

}
void simplificare(struct rational p)
        {
            int m=cmmdc(p.numarator,p.numitor);
            p.numarator=p.numarator/m;
            p.numitor=p.numitor/m;
        printf("%d/%d",p.numarator,p.numitor);
        }

void adunare (struct rational p,struct rational q)
    {
        struct rational rez;
        rez.numarator=p.numarator*q.numitor+q.numarator*p.numitor;
        rez.numitor=p.numitor*q.numitor;
        simplificare(rez);

    }

void scadere (struct rational p,struct rational q)
    {
        struct rational rez;
        rez.numarator=p.numarator*q.numitor-q.numarator*p.numitor;
        rez.numitor=p.numitor*q.numitor;
        simplificare(rez);

    }

void impartire (struct rational p,struct rational q)
    {
        struct rational rez;
        rez.numarator=p.numarator*q.numitor;
        rez.numitor=p.numitor*q.numarator;
        simplificare(rez);

    }
void inmultire (struct rational p,struct rational q)
    {
        struct rational rez;
        rez.numarator=p.numarator*q.numarator;
        rez.numitor=p.numitor*q.numitor;
        simplificare(rez);

    }
void putere(struct rational p,int puterea)
    {
        p.numarator=pow(p.numarator,puterea);
        p.numitor=pow(p.numitor,puterea);
        simplificare(p);
    }
int main()
{
  int exp;
  printf(" Introduceti cele doua fractii:\n");
  printf(" Prima fractie:\n");
   scanf("%d",&p.numarator);
   scanf("%d",&p.numitor);
     printf(" A doua fractie:\n");
     scanf("%d",&q.numarator);
   scanf("%d",&q.numitor);
   printf("Rezultatul adunarii este:\n");
   adunare(p,q);

   printf("\nRezultatul scaderii este:\n");
   scadere(p,q);

   printf("\nRezultatul inmultirii este:\n");
   inmultire(p,q);
   printf("\nRezultatul impartirii este:\n");
   impartire(p,q);
   printf("\nintroduceti puterea pentru prima fractie:");
   scanf("%d",&exp);
   printf("\nRezultatul ridicarii la putere este:\n");
   putere(p,exp);
    return 0;
}
