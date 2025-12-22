/*scrieti functia pentru inserarea unui şir de caractere într-un alt şir de la poziţia specificată*/
#include <stdlib.h>
#include <string.h>

int inserare(char x[100],char y[100],int n)
{
    int i,j;
    for(i=0;i<strlen(y);i++)
    {
        for(j=strlen(x);j>=n;j--)
        x[j+1]=x[j];
        x[n]=y[i];
        n++;
    }
    printf("sirul obtinut este %s",x);
}
int main()
{
    int n;
    char x[255];
    char y[255];

    printf("introduceti sirul :");
    gets(x);
    printf("introduceti sirul urmat sa fie inserat :");
    gets(y);
    printf("introduceti pozitia dorita :");
    scanf("%d",&n);
    n--;
    inserare(x,y,n);
}
