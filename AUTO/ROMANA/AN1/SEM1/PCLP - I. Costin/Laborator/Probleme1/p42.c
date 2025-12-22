/*42. Sa se scrie o functie care primind ca parametru un numar arab în baza 10, 
calculeaza sirul de caractere ce reprezinta numarul respectiv sub forma romana.*/

#include<stdlib.h>
#include<stdio.h>
#include<string.h>

char transform(int n)
{
    char rom[13][3]={"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};
    int i, arb[13]={1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
    char r[100]="";
    for(i=0;i<13;i++)
    {
        while(n>=arb[i])
        {
            n=n-arb[i];
            strcat(r,rom[i]);
        }
    }
    printf("%s",r);
}

int main()
{
    int nr;
    printf("Introduceti un numar (<=3999) cu cifre arabe n= ");
    scanf("%d",&nr);
    printf("Numarul scris cu cifre romane corespunzator lui %d este ",nr);
    transform(nr);
    getch();
    return 0;
}
