/*afişarea conţinutului unui fişier în ordine inversă
caracter cu caracter*/
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
        strrev(c);
    printf("\nlinia %d contine sirul : %s",i,c);
    i++;
    }

    fclose(f);
    return 0;
}
