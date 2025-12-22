/*căutarea unui şir de caractere într-un fişier (numele fişierului şi stringul se citesc de la tastatură)
- ca rezultat se va afişa linia în care s-a găsit şirul sau un mesaj care indică absenţa sirului din fişierul indicat*/
#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *f;
    int i=1,ok=1;
    char c[100],s[100];
    f=fopen("fisier.txt","r");
    if(f==NULL)
    {
        perror("Eroare");
        exit(1);
    }
    printf("Introduceti sirul cautat:");
    gets(s);
    while(fgets(c,256,f)!=NULL )
    {
        //puts(c);
        if(strstr(c,s))
           {
               printf("\nlinia %d contine sirul : %s",i,s);
                ok=0;
           }
        i++;
}
    if(ok==1)
        printf("Sirul nu se gaseste in fisier");

    fclose(f);
    return 0;
}
