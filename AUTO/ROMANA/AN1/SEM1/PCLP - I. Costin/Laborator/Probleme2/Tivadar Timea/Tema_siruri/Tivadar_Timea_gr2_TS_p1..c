/*scrieti functia pentru determinarea numărului de cuvinte dintr-un şir de caractere*/
#include <conio.h>
#include <string.h>

int cuvinte(char **v)
{
    int i,nr;

    printf("introduceti sirul de caractere ");
    gets(v);
    nr=2;
    for(i=1;i<strlen(v);i++)
    if((*(v+i)==' ') && (*(v+i-1)!=' '))
            nr++;
    if(*(v+i)!=' ')
        nr++;
    printf("sirul are  %d cuvinte ",nr);
}
int main()
{
    char *s;
    cuvinte(&s);
}
