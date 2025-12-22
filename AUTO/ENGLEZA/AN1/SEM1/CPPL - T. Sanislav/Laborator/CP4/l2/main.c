#include <stdio.h>
#include <stdlib.h>

int main()
{
    int array [5] = {1, 2, 3, 4, 5};
    int *array_ptr = array;
    int i = 0;
    int offset = 0;

    printf("Array printed with: \n Array subscript notation \n");
    for (i = 0; i < 5; i++) {
        printf("array[%d] = %d\n", i, array[i]);
    }

        printf("\n Array offset notation \n");
    for (offset = 0; offset < 5; offset++) {
        printf("*(array + %d) = %d\n", offset, *(array + offset));
    }


        printf("\n Pointer subscript notation \n");
    for (i = 0; i < 5; i++) {
        printf("array_ptr[%d] = %d\n", i, array_ptr[i]);
    }
        printf("\n Pointer offset notation \n");
    for (offset = 0; offset < 5; offset++) {
        printf("*(array_ptr + %d) = %d\n", offset, *(array_ptr + offset));
    }


    return 0;
}
