#include <stdio.h>
#include <stdlib.h>

void fun (int *);

int main()
{
    int array[]={10,20,30,40,50};
    int i, *array_ptr = array;
    for (i = 0; i<4; i++) {
        fun (array_ptr++); //inaiinteaza la adresa urmatoare
        printf("%d\n", *array_ptr);
    }
    return 0;
}

void fun (int *i) {
    *i = *i + 1;
}
