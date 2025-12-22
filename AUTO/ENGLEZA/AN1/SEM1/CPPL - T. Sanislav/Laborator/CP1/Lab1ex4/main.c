#include <stdio.h>
#include <stdlib.h>

int main()
{
    int i;

    for (i = 0; i<16; i++)
    {
    printf("Decimal value = %7d\n", i);
    printf("Octal value = %#o, Hexadecimal value = %#X\n", i,i);
    printf("------------------------\n");
    }
    return 0;
}
