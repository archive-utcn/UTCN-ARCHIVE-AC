#include <stdio.h>
#include <stdlib.h>
#include <array_int.h>

// merge sort
void print_arr(int elm)
{
    printf("%d ", elm);
}

int main()
{
    Array *a1 = array_new(10);

    array_push_back(a1, -1);
    array_push_back(a1, 7);
    array_push_back(a1, 3);
    array_push_back(a1, -5);
    array_push_back(a1, 4);
    array_push_back(a1, 0);

    printf("Inainte sortare: ");
    array_foreach(a1, print_arr);
    printf("\n");

    mergeSort(a1);

    printf("Dupa sortare: ");
    array_foreach(a1, print_arr);
    printf("\n");
    return 0;
}
