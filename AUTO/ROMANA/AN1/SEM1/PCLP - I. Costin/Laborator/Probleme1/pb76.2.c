/* Sa se scrie un program modularizat care citeste datele legate de studentii unei grupe: nume, data
nasterii, adresa si îi afiseaza în ordine crescatoare lexicografica.*/
#include <stdio.h>
#include <stdlib.h>
#include<conio.h>
#include<string.h>

struct student {char nume[30];char data_n[10];char adresa[20];};
struct student s[20];

void citire(struct student s[],int *n)
    {
      printf("introduceti numarul de studenti:");
      scanf("%d",n);

        int i;
        for (i=0;i<*n;i++)
            {  fflush(stdin);
               printf("introduceti numele studentului %d:",i);
              scanf("%s",s[i].nume);
              printf("introduceti data nasterii studentului %d:",i);
              fflush(stdin);
              scanf("%s",s[i].data_n);
              printf("introduceti adresa studentului %d",i);
              fflush(stdin);
              scanf("%s",s[i].adresa);

            }

    }
void afisare(struct student s[],int n)
    {

      int i;
      for (i=0;i<n;i++)
            printf("\n%s  %s  %s",s[i].nume,s[i].data_n,s[i].adresa);


    }


void sortare(struct student s[],int n)
    {
       struct student aux;
       int i,j;
            for (i=0;i<n-1;i++)
                for (j=0;j<n;j++)
                     if (strcmp(s[i].nume,s[j].nume)>0)  {strcpy(aux.nume,s[i].nume);
                                                     strcpy(aux.data_n,s[i].data_n);
                                                     strcpy(aux.adresa,s[i].adresa);

                                                     strcpy(s[i].nume,s[j].nume);
                                                     strcpy(s[i].data_n,s[j].data_n);
                                                     strcpy(s[i].adresa,s[j].adresa);

                                                    strcpy(s[j].nume,aux.nume);
                                                     strcpy(s[j].data_n,aux.data_n);
                                                     strcpy(s[j].adresa,aux.adresa);
                                                    }

    }

int main()
{
    int n;
    citire(s,&n);
    sortare(s,n);
    afisare(s,n);
    return 0;
}
