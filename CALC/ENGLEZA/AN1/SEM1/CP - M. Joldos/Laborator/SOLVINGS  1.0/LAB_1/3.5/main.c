#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("CHAR | ASCII\n");
    for ( int i=32;i<=126;i++)
    {
        printf("%-c %7d\n",i,i);
    }
    return 0;
}
