/*citirea unei succesiuni de cuvinte până se introduce cuvantul "gata" si a unei funcții denumite ordonare, care să ordoneze cuvintele crescător
    1. dupa lungime
    2. alfabetic*/
#include <string.h>
#include <stdlib.h>

void alfabet(char x[][100],int n,char s)
{
    char aux[100];
    int i,j;

    for(i=0;i<n-1;i++)
    for(j=i+1;j<n;j++)
    if (strcmp(x[i],x[j])>0)
    {
        strcpy(aux,(char*)x[i]);
        strcpy((char*)x[i],(char*)x[j]);
        strcpy((char*)x[j],aux);
    }
    for(i=0;i<n;i++)
    printf("%s ",(char*)x[i]);
}
void lungime(char x[][100],int n)
{
    char aux[100];
    int i,j;

    for(i=0;i<n-1;i++)
    for(j=i+1;j<n;j++)
    if (strlen(x[i])>strlen(x[j]))
    {
        strcpy(aux,(char*)x[i]);
        strcpy((char*)x[i],(char*)x[j]);
        strcpy((char*)x[j],aux);
    }
    for(i=0;i<n;i++)
    printf("%s ",(char*)x[i]);
}
int main()
{
    char x[100][100],s[10]="gata";
    int i;

    i=-1;
    printf("introduceti sirul:\n");
    do
    {
        i++;
        gets(&x[i][0]);
    }
    while(strcmp(&x[i][0],s)!=0);
    printf("sirurile ordonate dupa lungime sunt :\n");
    lungime(x,i);
    printf("\nsirurile ordonate alfabetic sunt :\n");
    alfabet(x,i,s);
    }


