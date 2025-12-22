#include <stdio.h>
#include <stdlib.h>
#define SIZE 50

int main()
{
    char array[SIZE], *array_ptr=array;
    gets (array);
    char *fc = array;
    char *lc = array + strlen(array) - 1;
    char aux;

    while ( fc < lc) {
        aux = *fc;
        *fc++ = *lc;
        *lc-- = aux;
    }

    printf("%s", array);


    return 0;
}
