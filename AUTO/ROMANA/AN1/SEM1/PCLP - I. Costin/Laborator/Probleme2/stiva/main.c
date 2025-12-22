#include <stdio.h>
#include "stiva.h"

int main()
{
    char s[50];
    printf("Introduceti expresia:");
    gets(s);
    printf("Valoare expresia este %d",expresie(s));
}

