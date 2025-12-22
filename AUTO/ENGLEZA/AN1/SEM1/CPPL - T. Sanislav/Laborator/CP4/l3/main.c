#include <stdio.h>
#include <stdlib.h>

int main()
{
    char *string[3] = {"computer", "programming", "C language"};
    int i = 0;

    for ( i = 0; i<3; i++ )
    {
        printf("Value of string[%d] is %s.\n", i, string[i]);
    }
    return 0;
}
