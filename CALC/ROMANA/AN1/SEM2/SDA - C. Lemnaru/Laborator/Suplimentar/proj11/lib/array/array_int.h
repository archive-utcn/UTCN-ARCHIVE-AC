#pragma once

typedef struct Array Array;

Array *array_new(int capacity);

void array_free(Array *array);

void array_print(Array *array);

void array_push_back(Array *array, int elem);

int array_get(Array *array, int pos);

int array_get_size(Array *array);

void array_foreach(Array *array, void (*func)(int));

int* binarySearch(Array *array, int elem);

void mergeSort(Array *arr);
