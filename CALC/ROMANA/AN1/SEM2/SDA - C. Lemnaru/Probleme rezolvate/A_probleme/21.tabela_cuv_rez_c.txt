/*21. Se va crea o tabela fixa cu cuvintele rezervate din limbajul C. Se va scrie apoi o functie de cautare binara
a unui cuvânt în tabela.*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


char *tablouCuvinteRezervate[]={    "auto" ,
    "double",
    "int",
    "struct",
    "break",
    "else",
    "long",
    "switch",
    "case",
    "enum",
    "register",
    "typedef",
    "char",
    "extern",
    "return",
    "union",
    "const",
    "float",
    "short",
    "unsigned",
    "continue",
    "for",
    "signed",
    "void",
    "default",
    "goto",
    "sizeof",
    "volatile",
    "do",
    "if",
    "static",
    "while"};

int cautareBinara(char *cuvantCautat)
{
    int inf,sup,i,j;
    inf=0;
    sup=sizeof(tablouCuvinteRezervate)/sizeof(char*)-1;
    while(inf<=sup)
    {
        i=(inf+sup)/2;
        j=strcmp(cuvantCautat,tablouCuvinteRezervate[i]);
        if(!j)
        return i;
        else
        if(j>0)
        inf=i+1;
        else
        sup=i-1;
    }
    return -1;
}



int main()
{
    char word[30];
    int pozitie;
    printf("\nIntroduceti cuvantul pt cautare: ");
    fflush(stdin);
    scanf("%s",word);
    pozitie=cautareBinara(word);
    if(pozitie==-1)
    printf("\nCuvantul cautat nu e un cuvant rezervat!!");
    else
    printf("\nCuvantul se afla la pozitia %d",pozitie+1);
    return 0;
}
