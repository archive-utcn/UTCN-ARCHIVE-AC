#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("Size of primitive types in chars\nchar=%d\nshort=%d\nint=%d\nlong=%d\nfloat=%d\ndouble=%d\nlong long=%d",
        sizeof(char), sizeof(short), sizeof(int), sizeof(long), sizeof(float), sizeof(double), sizeof(long long));
    return 0;
}
