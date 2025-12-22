/*44. Sa se scrie o functie care determina daca un sir de caractere este subsir al altui sir de 
caractere, returnând ca valoare pozitia unde începe subsirul în sir în caz afirmativ sau –1 în caz contrar.*/

#include<stdlib.h>
#include<stdio.h>
#include<string.h>

int verif(char sir[], char subsir[])
{
    int l=0,l1=0,ok=0,i;//l1=lungimea primului subsir care incepe cu subsirul cautat
    char rez[100]="";
    l=strlen(sir);
    strcpy(rez,strstr(sir,subsir));
    l1=strlen(rez);
    i=0;
    while(ok==0)
    {
        ok=strcmp(sir[i+(l-l1)],rez[i]);
        i++;
    }
    if(ok!=0)
        return -1;
    else
        return l-l1;
}

int main()
{
    char s[100],ss[20];//s=sir, ss=subsir
    int poz=0;
    
    printf("Introduceti sirul de caractere ");
    gets(s);
    printf("Introduceti subsirul dorit ");
    gets(ss);
    poz=verif(s,ss);
    printf("%d",poz);
    getch();
    return 0;
}
