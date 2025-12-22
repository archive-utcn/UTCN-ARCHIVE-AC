/*citirea şi afişarea pe ecran a conţinutului unui fişier text (numele fişierului se citeşte de la tastatură)
linie cu linie - cu afişarea numărului de linie */
#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *f;
    char c[250];
    f=fopen("fisier.txt","r");
    if(f==NULL)
    {
        perror("Eroare");
        exit(1);
    }
    int i=1;
    while(fgets(c,256,f)!=NULL )
    {
    printf("\nlinia %d contine sirul : %s",i,c);
    i++;
    }
    fclose(f);
    return 0;
}
