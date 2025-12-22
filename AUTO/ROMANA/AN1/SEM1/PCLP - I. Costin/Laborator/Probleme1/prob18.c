/* 18. De pe mediul de intrare se citesc cifrele hexazecimale ale unui numar întreg în baza 16. Sa se
calculeze si sa se afiseze reprezentarea numarului în baza 10.*/
#include <stdio.h>
int main()
{
    char s[50];
    int x;
    printf("dati numalui in baza 16 ");
    gets(s);
    sscanf(s, "%x", &x);
    printf("%u \n", x);
    return(0);
}
