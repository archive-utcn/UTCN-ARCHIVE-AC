/*implementarea proprie a două dintre funcţiile definite in string.h:
 strcpy(), strncpy(), strcat(), strncat(), strcmp(), strncmp(), strlen().*/
#include <stdlib.h>
#include <string.h>

int functia_strcat(char v[200],char w[100])
{
    int n,i;
    printf("introduceti primul sir:");
    gets(v);
    printf("Introduceti al doilea sir:");
    gets(w);
    n=strlen(v);
    for(i=0;i<strlen(w);i++)
        v[n+i]=w[i];
    printf("sirului nou este:%s",v);
}
int functia_strcopy(char v[200],char y[100])
{
    int i;
    printf("introduceti sirul:");
    gets(v);
    for(i=0;i<strlen(v);i++)
    y[i]=v[i];

    printf("sirul copiat este: %s ",y);
}
int main()
{
    char v[200],w[100],y[100]="";
    functia_strcat(v,w);
    printf("\n");
    functia_strcopy(v,y);
}
