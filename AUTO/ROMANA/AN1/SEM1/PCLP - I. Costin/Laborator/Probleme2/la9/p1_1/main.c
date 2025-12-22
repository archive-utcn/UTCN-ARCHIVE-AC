/*citirea şi afişarea pe ecran a conţinutului unui fişier text (numele fişierului se citeşte de la tastatură)
    caracter cu caracter*/
#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *f;
    char c;
    f=fopen("fisier.txt","r");
    if(f==NULL)
    {
        perror("Eroare");
        exit(1);
    }
    c=fgetc(f);
    while(c!=EOF)
    {
        printf("%c",c);
        c=fgetc(f);
    }
    fclose(f);
    return 0;
}
