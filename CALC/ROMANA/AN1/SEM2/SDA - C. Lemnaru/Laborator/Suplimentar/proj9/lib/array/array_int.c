#include <stdlib.h>
#include <stdio.h>
#include <array_int.h>

struct Array
{
    int capacity;
    int size;
    int *data;
};

Array *array_new(int capacity)
{
    if (capacity < 1)
        return NULL;

    Array *a = (Array *)malloc(sizeof(Array));
    a->capacity = capacity;
    a->size = 0;
    a->data = (int *)calloc(capacity, sizeof(int));

    return a;
}

int array_contains(Array *array, int elem)
{
    if (array == NULL)
        return 0;
    if (array->size == 0)
        return 0;

    for (int i = 0; i < array->size; i++)
        if (array->data[i] == elem)
            return 1;
    return 0;
}

int array_get(Array *array, int pos)
{
    if (array == NULL)
        return 0;
    if (pos < 0)
        return 0;

    return array->data[pos];
}

int array_get_size(Array *array)
{
    if (array == NULL)
        return 0;
    return array->size;
}

void array_free(Array *array)
{
    if (array == NULL)
        return;
    free(array);
}

void array_print(Array *array)
{
    if (array == NULL)
    {
        printf("Pointer NULL\n");
        return;
    }
    if (array->data == NULL)
    {
        printf("Initializare defectuoasa\n");
        return;
    }
    if (array->size == 0)
    {
        printf("Array gol\n");
        return;
    }
    printf("Elemente: ");
    for (int i = 0; i < array_get_size(array); i++)
    {
        printf("%d ", array_get(array, i));
    }
    printf("\n");
}

void array_push_back(Array *array, int elem)
{
    if (array == NULL)
        return;
    if (array->size == array->capacity)
    {
        array->capacity <<= 1;
        array->data = (int*) realloc(array->data, array->capacity);
    }
    array->data[array->size] = elem;
    array->size++;
}

void array_foreach(Array *array, void (*func)(int))
{
    if (array == NULL)
        return;

    for (int i = 0; i < array->size; i++)
        func(array->data[i]);
}
