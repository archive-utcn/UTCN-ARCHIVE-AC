#include <stdlib.h>
#include <stdio.h>
#include <Vector.h>
#include <string.h>

struct _Vector
{
    unsigned elmSize;
    unsigned capacity;
    unsigned size;
    void *data;
};

Vector *vector_new(unsigned elmSize)
{
    if (elmSize < 1)
        return NULL;

    Vector *a = (Vector *)malloc(sizeof(Vector));
    a->elmSize = elmSize;
    a->capacity = 1;
    a->size = 0;
    a->data = calloc(1, elmSize);

    return a;
}

void *vector_at(Vector *vector, unsigned pos)
{
    if (vector == NULL)
        return 0;
    if (pos < 0)
        return 0;

    return vector->data + pos * vector->elmSize;
}

int elmIndex(Vector *vector, void *elm, int (*matchingFunc)(void *a, void *b))
{
    if (vector == NULL)
        return -1;

    for (int i = 0; i < vector->capacity; i++)
    {
        void *crt = vector_at(vector, i);
        if (matchingFunc(crt, elm))
            return i;
    }
    return -1;
}

void *vector_front(Vector *vector)
{
    if (vector == NULL)
        return NULL;
    if (vector->size == 0)
        return NULL;

    return vector->data;
}

int vector_contains(Vector *vector, void *elem, int (*compareFunction)(void *a, void *b))
{
    if (vector == NULL)
        return 0;
    if (vector->size == 0)
        return 0;

    for (int i = 0; i < vector->size; i++)
    {
        if (compareFunction(vector->data + i * vector->elmSize, elem) == 0)
            return 1;
    }
    return 0;
}

unsigned vector_size(Vector *vector)
{
    if (vector == NULL)
        return 0;
    return vector->size;
}

void vector_free(Vector *vector)
{
    if (vector == NULL)
        return;

    if (vector->data != NULL)
        free(vector->data);

    free(vector);
}

// void vector_print(Vector *vector)
// {
//     if (vector == NULL)
//     {
//         printf("Pointer NULL\n");
//         return;
//     }
//     if (vector->data == NULL)
//     {
//         printf("Initializare defectuoasa\n");
//         return;
//     }
//     if (vector->size == 0)
//     {
//         printf("Vector gol\n");
//         return;
//     }
//     printf("Elemente: ");
//     for (int i = 0; i < vector_size(vector); i++)
//     {
//         printf("%d ", vector_get(vector, i));
//     }
//     printf("\n");
// }

void vector_push_back(Vector *vector, void *elem)
{
    if (vector == NULL)
        return;

    // printf("capacity: %d, aici2: %p\n", vector->capacity, vector->data + vector->size * vector->elmSize);
    if (vector->size == vector->capacity)
    {
        vector->capacity <<= 1;
        // printf("new realloc size: %d\n", vector->capacity * vector->elmSize);
        vector->data = realloc(vector->data, vector->capacity * vector->elmSize);
        // memset(vector->data + vector->size, 0, vector->capacity - vector->size);
    }

    if (vector->data == NULL)
    {
        printf("Vector reallocation failed(pushback), aborting\n");
        abort();
    }

    // printf("aici3: %p, reallocd size: %d\n", vector->data, vector->capacity * (vector->elmSize));
    memcpy(vector->data + vector->size * vector->elmSize, elem, vector->elmSize);
    vector->size++;
}

void vector_clear(Vector *vector)
{
    if (vector == NULL)
        return;

    vector->size = 0;
}

void vector_insert(Vector *vector, unsigned position, void *elementRef)
{
    if (vector == NULL)
        return;
    if (position < 0)
        return;
    if (position > vector->size)
        return;

    if (vector->size == vector->capacity)
    {
        vector->capacity <<= 1;
        vector->data = realloc(vector->data, vector->capacity * vector->elmSize);
    }

    if (vector->data == NULL)
    {
        printf("Vector reallocation failed(insert), aborting\n");
        abort();
    }

    memmove(vector->data + (position + 1) * vector->elmSize, vector->data + position * vector->elmSize, (vector->size - position) * vector->elmSize);
    memcpy(vector->data + position * vector->elmSize, elementRef, vector->elmSize);
    vector->size++;
}

void vector_erase(Vector *vector, unsigned first, unsigned last)
{
    if (vector == NULL)
        return;
    if (first < 0 || last < 0)
        return;
    if (first >= vector->size || last >= vector->size)
        return;
    if (first > last)
        return;

    memmove(vector->data + first * vector->elmSize, vector->data + last * vector->elmSize, (vector->size - last) * vector->elmSize);
    vector->size -= last - first;
}

void vector_forEach(Vector *vector, void *context, void (*func)(void *elementRef, void *context))
{
    if (vector == NULL)
        return;

    for (int i = 0; i < vector->size; i++)
    {
        func(vector->data + i * vector->elmSize, context);
    }
}
