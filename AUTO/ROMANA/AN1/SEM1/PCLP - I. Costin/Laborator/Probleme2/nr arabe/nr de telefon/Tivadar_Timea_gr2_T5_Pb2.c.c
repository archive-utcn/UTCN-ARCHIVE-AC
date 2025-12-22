/*Scrieți un program care transformă un numar de telefon specificat sub forma alfabetică în forma numerică - considerând modul de asociere între cifre si litere folosite de telefoanele mobile.

    ex. CALLME : 225563
    daca sunt si alte caractere in afara de cifre acestea nu se vor modifica: ex. 1-800-COL-LECT : 1-800-265-5328*/
#include <stdio.h>
#include <stdlib.h>

int main()
{
    char a[10];
    int n,i;
    gets(a);
    n=strlen(a);
    for(i=0;i<n;i++)
        switch(a[i])
        {
            case 'A':
            case 'B':
            case 'C': { printf("2"); break;}
            case 'D':
            case 'E':
            case 'F': { printf("3"); break;}
            case 'G':
            case 'H':
            case 'I': { printf("4"); break;}
            case 'J':
            case 'K':
            case 'L': { printf("5"); break;}
            case 'M':
            case 'N':
            case 'O': { printf("6"); break;}
            case 'P':
            case 'Q':
            case 'R':
            case 'S': { printf("7"); break;}
            case 'T':
            case 'U':
            case 'V':{ printf("8"); break;}
            case 'W':
            case 'X':
            case 'Y':
            case 'Z':{ printf("9"); break;}
            default: printf("%c",a[i]);
        }
    return 0;
}
