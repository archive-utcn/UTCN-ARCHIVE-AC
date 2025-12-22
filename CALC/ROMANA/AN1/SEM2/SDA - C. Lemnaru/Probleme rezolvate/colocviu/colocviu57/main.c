/*Sa se scrie un program care sa vina in sprijinul alcatuirii orarului cursurilor facultative. Exista
un numar de N=20 cursuri si M=100 studenti. La inceputul anului, fiecare student isi exprima optiunea
privind cursurile la care direste sa participe. Un student poate alege un numar oarecare de cursuri (0..N)
, dar in medie numarul cursurilor alese este de 2-3. Problema responabilului cu alcatuirea orarului este
de a identifica care sunt cursurile care pot fi programate sa se desfasoare in paralel.
Se pot desfasura in paralel 2 sau mai multe cursuri, cu conditia sa nu existe suprapuneri in
orarul nici unui student.
exemplu :
N=5, m=6
student 1 alege cursurile 1, 2
student 2 nu  alege nimic
student 3 alege cursurile 1,3
student 4 alege cursul 4
student 5 alege cursul 4
student 6 alege cursul 5
cursurile care s pot desfasura in paralel sunt (1,4,5)(2,3)
*/
#include <stdio.h>
#include <stdlib.h>

struct curs
{
    int indice, nr_stud;
    int stud [100];
}v[100];

int n,m ,ind_max;

void citire ()
{
    int i, j;
    printf ("n="); scanf ("%d", &n);
    printf ("m="); scanf ("%d", &m);
    for (i=1; i<=n; i++)
    {
        printf ("nr studenti pentru cursul %d:", i);
        scanf ("%d", &v[i].nr_stud);
        for (j=1; j<=v[i].nr_stud; j++)
        {
            printf ("Student %d:", j);
            scanf ("%d", &v[i].stud[j]);
        }
    }
    }

int stud_comuni(int i, int k)
{
    int a,b,n1,n2;
    n1=v[i].nr_stud;
    n2=v[k].nr_stud;
    for(a=1;a<=n1;a++)
     for(b=1;b<=n2;b++)
      if(v[i].stud[a]==v[k].stud[b])
            return 1;

return 0;
}

void f ()
{
    int i, j, k, sem, sem2;
    v[1].indice=1; ind_max=1;
    for (i=2; i<=n; i++)
    {
        sem =0; //pp ca nu gasim indice
        for (j=1; j<= ind_max&&(sem==0); j++)
        {
            sem2=0; //pp ca nu exista cu nici un curs din categ
            for (k=1;k<i&&(sem2==0);k++)
               if (v[k].indice==j)
                {  if (stud_comuni(i,k)==1)
                      sem2=1;
                }

            if (sem2==0)
            {
                v[i].indice=j;
                sem=1;
            }
        }
        if (sem==0)
        {
           ind_max++;
           v[i].indice =ind_max;
        }
    }
}

void afisare ()
{
    int i, j;
    printf("\n");
    for (i=1; i<= ind_max; i++)
    {
        printf ("categ %d:( ", i);
        for (j=1; j<=n; j++)
          if (v[j].indice ==i)
           printf ("%d,", j); //j este numele cursului
        printf("\b)\n");
    }
}

void afisare_structura()
{
   int i,j;
   printf("Structura:");
   for(i=1;i<=n;i++)
    {
         printf("\nStudenti pt cursul %d:",i);
         for(j=1;j<=v[i].nr_stud;j++)
          printf("%d ",v[i].stud[j]);
    }
}


int main()
{
    citire ();
    afisare_structura();
    f();
    afisare();
    return 0;
}

