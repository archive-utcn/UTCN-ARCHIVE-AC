/*scrieti functia pentru ştergerea unui subşir de dimensiune dată din şirul iniţial de la poziţia specificată*/
#include <stdlib.h>
#include <string.h>

int stergere(char v[100],int dim,int poz)
{
    int i,x,n;
    x=poz+dim;
    n=strlen(v);
    for(i=poz;i<=n-dim;i++)
    {
        v[i]=v[x];
        x++;
    }
    v[n-dim]=NULL;
    printf("sirul obtinut este %s",v);
}
int main()
{
    int dim,poz;
    char v[100];

    printf("introduceti sirul de caractere ");
    gets(v);
    printf("introduceti dimensiunea subsirului pe care doriti sa-l stergeti si pozitia de unde incepe ");
    scanf("%d %d",&dim,&poz);
    stergere(v,dim,poz);
}
