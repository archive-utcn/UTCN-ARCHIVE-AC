#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "intHashTable.h"

#define hashTableEmptyPrecaution \
    if (ht == NULL)              \
        return;

typedef struct
{
    int val, key;
} pair;

int hashFn(int key, int elements)
{
    return (key % elements);
}

struct _IntHashTable
{
    pair *table;
    int size;
};

IntHashTable *intHashTable_new(unsigned size)
{
    IntHashTable *new = malloc(sizeof(IntHashTable));
    new->table = malloc(sizeof(pair) * size);
    memset(new->table, -1, sizeof(pair) * size);
    new->size = size;
    return new;
}

void intHashTable_free(IntHashTable *ht)
{
    hashTableEmptyPrecaution;

    // if (ht->table != NULL)
    free(ht->table);

    free(ht);
}

void intHashTable_put(IntHashTable *ht, int key, int value)
{
    hashTableEmptyPrecaution;

    int index;
    for (index = 0; index < ht->size; index++)
        if (ht->table[hashFn(key + index, ht->size)].key == -1)
            break;

    if (index == ht->size)
        return; // table is full

    pair *p = ht->table + hashFn(key + index, ht->size);
    p->key = key;
    p->val = value;
}

int *intHashTable_get(IntHashTable *ht, int key)
{
    if (ht == NULL)
        return NULL;

    int index;
    for (index = 0; index < ht->size; index++)
        if (ht->table[hashFn(key + index, ht->size)].key == key)
            break;

    if (index == ht->size)
        return NULL;

    return &(ht->table[hashFn(key + index, ht->size)].val);
}

void intHashTable_delete(IntHashTable *ht, int key)
{
    hashTableEmptyPrecaution;

    int index;
    for (index = 0; index < ht->size; index++)
        if (ht->table[hashFn(key + index, ht->size)].key == key)
            break;

    if (index == ht->size)
        return;

    ht->table[hashFn(key + index, ht->size)].key = -1;
}

void intHashTable_print(IntHashTable *ht)
{
    hashTableEmptyPrecaution;

    int i;
    for (i = 0; i < ht->size; i++)
        if (ht->table[i].key != -1)
            printf("%d ", ht->table[i].val);
    printf("\n");
}
