/*scrieti o functie pentru transformarea unui şir de caractere astfel încât literele mici să devină litere mari respectiv literele mari să devină mici.*/
#include <conio.h>
#include <string.h>

int transformare(char v[100])
{
    int i;

    printf("introduceti sirul:");
    gets(v);
    for(i=0;i<strlen(v);i++)
    {
        if((v[i]>='A') && (v[i]<='Z'))
            v[i]=v[i]+32;
        else
            if((v[i]>='a') && (v[i]<='z'))
                v[i]=v[i]-32;
    }
    printf("sirul rezultat este : %s",v);
}
int main()
{
    char v[100];
    transformare(v);
}
