#include<stdio.h>
#include<malloc.h>
#include<process.h>
#include<conio.h>
#include<stdlib.h>

int main()
{
    char *str1, *str2;
    if((str1 = (char *) farmalloc(101111111)) == NULL)
    {
        printf("\nMem insuficienta\n");
        exit(1);
    }
    printf("\nIntroduceti primul sir de caractere:");
    gets(str1);
    printf("\Sirul introdus este : %s",str1);


    if((str2 = (char *) calloc(100,sizeof(char))) == NULL)
    {
        printf("\nMem insuficienta\n");
        exit(2);
    }
    printf("\nIntroduceti al doilea sir de caractere:");
    gets(str2);
    printf("\Sirul introdus este : %s",str2);

    free(str1);
    free(str2);
}

