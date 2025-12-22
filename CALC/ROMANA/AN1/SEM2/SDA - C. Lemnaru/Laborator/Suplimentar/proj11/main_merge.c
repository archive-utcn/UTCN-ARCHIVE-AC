#include <stdio.h>
#include <stdlib.h>
#include <array_int.h>

void print_arr(int elm)
{
    printf("%d ", elm);
}

Array *arr_merge_vectors(Array *a1, Array *a2)
{
    int sz1 = array_get_size(a1), sz2 = array_get_size(a2);
    Array *rez = array_new(sz1 + sz2);

    int elm1, elm2, i1 = 0, i2 = 0;
    while (i1 < sz1 && i2 < sz2)
    {
        elm1 = array_get(a1, i1);
        elm2 = array_get(a2, i2);
        if (elm1 < elm2)
        {
            array_push_back(rez, elm1);
            i1++;
        }
        else
        {
            array_push_back(rez, elm2);
            i2++;
        }
    }

    while (i1 < sz1)
    {
        array_push_back(rez, array_get(a1, i1++));
    }

    while (i2 < sz2)
    {
        array_push_back(rez, array_get(a2, i2++));
    }

    return rez;
}

int main()
{
    Array *a1 = array_new(10), *a2 = array_new(10);

    array_push_back(a1, 0);
    array_push_back(a1, 2);
    array_push_back(a1, 4);
    array_push_back(a1, 5);

    array_push_back(a2, -1);
    array_push_back(a2, 3);
    array_push_back(a2, 3);
    array_push_back(a2, 4);
    array_push_back(a2, 6);

    printf("Array 1: ");
    array_foreach(a1, print_arr);
    printf("\n");

    printf("Array 2: ");
    array_foreach(a2, print_arr);
    printf("\n");

    Array *rez = arr_merge_vectors(a1, a2);

    printf("Array result: ");
    array_foreach(rez, print_arr);
    printf("\n");

    return 0;
}
