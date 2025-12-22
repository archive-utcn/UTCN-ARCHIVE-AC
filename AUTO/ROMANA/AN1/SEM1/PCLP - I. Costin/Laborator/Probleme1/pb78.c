/*Sa se scrie un program care citeste n siruri de caractere si afiseaza sirul cel mai lung si
sirul cel mai mare alfanumeric. */
#include <stdio.h>
#include <stdlib.h>
#include<string.h>

int main()
{
    char siruri[20][50];
    int n;
    printf("Introduceti numarul de siruri:");
    scanf("%d",&n);
    int i;
    for (i=0;i<n;i++)
        {
            fflush(stdin);
        printf("Introduceti sirul %d :",i);
        gets(siruri[i]);
        }
   int dim[20];
   for (i=0;i<n;i++)
        dim[i]=strlen(siruri[i]);
   int max=dim[0];
   int poz=0;
   for (i=1;i<n;i++)
        if (dim[i]>max)  {max=dim[i];  poz=i;}
   printf("\nSirul cel mai lung este:\n");
   puts(siruri[poz]);
   char aux[50];
   int j;
   for (i=0;i<n-1;i++)
        for (j=i+1;j<n;j++)
            {
                if(strcmp(siruri[i],siruri[j])>0) {strcpy(aux,siruri[i]);
                                                   strcpy(siruri[i],siruri[j]);
                                                    strcpy(siruri[j],aux);
                                                    }
            }

printf("\n\nSirul cel mai mare alfanumeric este:");
    puts(siruri[n-1]);

}



