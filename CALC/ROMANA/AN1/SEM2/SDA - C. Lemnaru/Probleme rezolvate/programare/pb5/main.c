#include <stdio.h>
#include <stdlib.h>

typedef struct nod
{
    int x;
    char n[40];
    struct nod *urm;
}Nod;


int main()
{
    printf("%d\n",sizeof(Nod));
    printf("%d",sizeof(char));
    return 0;
}
