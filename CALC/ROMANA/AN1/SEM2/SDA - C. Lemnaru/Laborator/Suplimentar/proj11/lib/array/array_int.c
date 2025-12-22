#include <stdlib.h>
#include <stdio.h>
#include "array_int.h"

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
        array->capacity << 1;
        array->data = (int *)realloc(array->data, array->capacity);
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

int *bSearch(Array *array, int elem, int left, int right)
{
    if (left > right)
        return NULL;

    int mid = (left + right) / 2;

    if (array->data[mid] == elem)
        return &array->data[mid];

    if (array->data[mid] > elem)
        return bSearch(array, elem, left, mid - 1);

    return bSearch(array, elem, mid + 1, right);
}

int *binarySearch(Array *array, int elem)
{
    if (array == NULL)
        return NULL;

    if (array->data[0] > elem || array->data[array->size - 1] < elem)
        return NULL;

    return bSearch(array, elem, 0, array->size - 1);
}

void swap(int *a, int *b)
{
    int c = *a;
    *a = *b;
    *b = c;
}

void arr_merge_vectors(int *a, int sz1, int *b, int sz2)
{
    if (sz1 == 0 || sz2 == 0)
        return;
    if (sz1 == 1 && sz2 == 1)
    {
        if (a[0] > b[0])
            swap(a, b);
        return;
    }
    arr_merge_vectors(a, sz1 / 2, a + sz1 / 2, sz1 - sz1 / 2);
    arr_merge_vectors(b, sz2 / 2, b + sz2 / 2, sz2 - sz2 / 2);
    int *c = (int *)malloc((sz1 + sz2) * sizeof(int));
    int i = 0, j = 0, k = 0;

    while (i < sz1 && j < sz2)
    {
        if (a[i] < b[j])
        {
            c[k] = a[i];
            i++;
        }
        else
        {
            c[k] = b[j];
            j++;
        }
        k++;
    }

    while (i < sz1)
    {
        c[k] = a[i];
        i++;
        k++;
    }

    while (j < sz2)
    {
        c[k] = b[j];
        j++;
        k++;
    }

    for (int i = 0; i < sz1 + sz2; i++)
        a[i] = c[i];

    free(c);
}

void mergeSort(Array *arr)
{
    if (arr == NULL)
        return;

    if (array_get_size(arr) <= 1)
        return;

    arr_merge_vectors(arr->data, arr->size / 2, arr->data + arr->size / 2, arr->size - arr->size / 2);
}
