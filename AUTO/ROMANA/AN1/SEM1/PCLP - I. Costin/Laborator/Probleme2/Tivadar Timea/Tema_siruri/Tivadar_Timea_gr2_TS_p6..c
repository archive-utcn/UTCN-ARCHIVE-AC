/*scrieti functia pentru determinarea dacă un şir de caractere este palindrom
(nu contează dacă literele sunt mari sau mici si nu se iau in considerare spațiile si semnele de punctuație: .,!?-)*/
#include <conio.h>
#include <string.h>

int palindrom(char v[100])
{
    int i,k;
    char w[100]="";

    k=0;
    for(i=0;i<strlen(v);i++)
    if(v[i]!=' ' && v[i]!='.' && v[i]!=',' && v[i]!='!' && v[i]!='?' && v[i]!='-')
    {
        w[k]=v[i];
        k++;
    }
    for(i=0;i<strlen(w);i++)
    if(w[i]>='A' && w[i]<='Z')
    w[i]=w[i]+32;
    k=0;
    for(i=0;i<=strlen(v)/2;i++)
    if(w[i]!=w[strlen(w)-i-1])
    k=1;
    if(k==0)
    printf("sirul este palindrom");
    else
    printf("sirul nu este palindrom");
}
int main()
{
    char v[100],w[100];
    printf("introduceti sirul de caractere :");
    gets(v);
    palindrom(v);
}
