#include <stdlib.h>
#include <stdio.h>
#include <array_int.h>

// divide et impera

void test()
{
    printf("%s\n", __FUNCTION__);

    Array *a = array_new(1);
    array_push_back(a, 1);
    array_push_back(a, 2);
    array_push_back(a, 4);
    array_push_back(a, 7);
    array_push_back(a, 10);

    int elem = 1;
    printf("Elem %d %s\n", elem, binarySearch(a, elem) ? "exista" : "nu exista");

    array_free(a);
    printf("\n\nSuccess!\n");
}

int main()
{
    test();
    return 0;
}
