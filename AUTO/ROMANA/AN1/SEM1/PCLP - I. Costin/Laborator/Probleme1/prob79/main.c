/*De la tastatura se citesc pentru n carti autorul, titlul cartii si anul de aparitie. Sa se afiseze:
a) numele autorilor în ordine alfabetica;
b) numele autorilor si a cartilor sale în ordinea anilor de aparitie.*/

#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>
int pus[100];

int main()
{
    int n, i,gata, an_aux,j;
    char aux[40], aux1[60];
    strcpy(aux," ");
    strcpy(aux1," ");
    struct carte{char autor[40];
                 char titlu[60];
                 int an;
                };
    struct carte books[100];

    printf("Introduceti numarul de carti:\n");
    scanf("%d", &n);

    printf("\nIntroduceti autorul, titlul si anul\n");
    for(i=1;i<=n;i++)
    {
        /*scanf("%s %s %d", &books[i].autor, &books[i].titlu, &books[i].an);*/

        gets(books[i].autor);
        gets(books[i].autor);

        gets(books[i].titlu);
        gets(books[i].titlu);
        scanf("%d", &books[i].an);

    }

    do{ gata=1;
        for(i=1;i<n;i++)
        if(strcmp(books[i].autor,books[i+1].autor)>0) {
                                                        strcpy(aux,books[i].autor);
                                                        strcpy(books[i].autor,books[i+1].autor);
                                                        strcpy(books[i+1].autor,aux);
                                                        strcpy(aux1,books[i].titlu);
                                                        strcpy(books[i].titlu,books[i+1].titlu);
                                                        strcpy(books[i+1].titlu,aux1);
                                                        an_aux=books[i].an;
                                                        books[i].an=books[i+1].an;
                                                        books[i+1].an=an_aux;
                                                        gata=0;
                                                      }

     }while(!gata);

     for(i=1;i<n;i++)
     for(j=i+1;j<=n;j++)
     if(strcmp(books[i].autor,books[j].autor)==0) pus[j]++;

    printf("\nNumele autorilor in ordine alfabetica:\n");
    for(i=1;i<=n;i++)
    {
        if(pus[i]==0)
        { printf("%s", books[i].autor);
          printf("\n");
        }
    }

     do{ gata=1;
        for(i=1;i<n;i++)
        if(books[i].an>books[i+1].an&&strcmp(books[i].autor,books[i+1].autor)==0) {

                                                                                     an_aux=books[i].an;
                                                                                     books[i].an=books[i+1].an;
                                                                                     books[i+1].an=an_aux;
                                                                                     gata=0;
                                                      }

     }while(!gata);


    printf("\nNumele autorilor si cartile in functie de anul de aparitie:\n");
    for(i=1;i<=n;i++)
    {
        printf("%s %s %d", books[i].autor, books[i].titlu, books[i].an);
        printf("\n");
    }

    return 0;
}
