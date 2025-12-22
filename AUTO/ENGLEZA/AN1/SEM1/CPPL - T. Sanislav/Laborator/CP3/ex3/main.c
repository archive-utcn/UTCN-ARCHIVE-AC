#include <stdio.h>
#include <stdlib.h>

int main()
{
    unsigned short int i = 0;

    for (i<=5 && i>=-1; ++i; i>0) printf("%u,",i);
    return 0;
}
