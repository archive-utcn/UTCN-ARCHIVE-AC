/*afişarea conţinutului unui fişier în ordine inversă
caracter cu caracter*/
#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *f;
    int i,j,n;
    char c,s[255];
    f=fopen("fisier.txt","r");
    if(f==NULL)
    {
        perror("Eroare");
        exit(1);
    }
    c=fgetc(f);i=0;
    while(c!=EOF)
    {
        s[i]=c;
        c=fgetc(f);
        i++;
    }
    n=i;
    for(j=n-1;j>=0;j--)
        printf("%c",s[j]);
    fclose(f);
    return 0;
}
