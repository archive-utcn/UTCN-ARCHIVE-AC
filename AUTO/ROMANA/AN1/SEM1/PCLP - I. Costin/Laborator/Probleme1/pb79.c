/*De la tastatura se citesc pentru n carti autorul, titlul cartii si anul de aparitie. Sa se afiseze:
a) numele autorilor în ordine alfabetica;
b) numele autorilor si a cartilor sale în ordinea anilor de aparitie. */
#include <stdio.h>
#include <stdlib.h>
#include<string.h>

struct carte { char autor[20];char titlu[20];int an;};
struct carte s[20];

int main()
{
    int n,i;
    printf("Introduceti numarul de carti:");
    scanf("%d",&n);
    for (i=0;i<n;i++)
        {
            printf("Numele autorului pentru cartea %d :",i);
            fflush(stdin);
            gets(s[i].autor);
            printf("Titlul pentru cartea %d :",i);
            fflush(stdin);
            gets(s[i].titlu);
            printf("Anul pentru cartea %d :",i);
            scanf("%d",&s[i].an);
        }

       char aux[20]; int aux_nr;
   int j;
   for (i=0;i<n-1;i++)
        for (j=i+1;j<n;j++)
            {
                if(strcmp(s[i].autor,s[j].autor)>0) {strcpy(aux,s[i].autor);
                                                   strcpy(s[i].autor,s[j].autor);
                                                    strcpy(s[j].autor,aux);
                                                    strcpy(aux,s[i].titlu);
                                                   strcpy(s[i].titlu,s[j].titlu);
                                                    strcpy(s[j].titlu,aux);
                                                    aux_nr=s[i].an;
                                                    s[i].an=s[j].an;
                                                    s[j].an=aux_nr;
                                                    }
            }


  printf("Autorii cartilor in ordine alfabetica sunt:\n");
    for (i=0;i<n;i++)
     puts(s[i].autor);



 for (i=0;i<n-1;i++)
        for (j=i+1;j<n;j++)
            {
                if(s[i].an>s[j].an) {strcpy(aux,s[i].autor);
                                                   strcpy(s[i].autor,s[j].autor);
                                                    strcpy(s[j].autor,aux);
                                                    strcpy(aux,s[i].titlu);
                                                   strcpy(s[i].titlu,s[j].titlu);
                                                    strcpy(s[j].titlu,aux);
                                                    aux_nr=s[i].an;
                                                    s[i].an=s[j].an;
                                                    s[j].an=aux_nr;
                                                    }
            }


   printf("\n\nLista autorilor si a cartilor ordonate dupa anul de aparitie este:\n");
    for (i=0;i<n;i++)
        {
            puts(s[i].autor);
            puts(s[i].titlu);
            printf("\n");

        }
    return 0;
}
