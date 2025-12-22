#include <stdlib.h>
#include <stdio.h>
#include "intHashTable.h"

void test1()
{
    printf("%s starts:\n", __FUNCTION__);
    IntHashTable *table = intHashTable_new(10);
    intHashTable_put(table, 5,6);
    intHashTable_put(table, 15,16);
    intHashTable_delete(table, 10);
    intHashTable_delete(table, 5);

    // print hash table
    intHashTable_print(table);

    intHashTable_free(table);

    printf("Success!\n");
}

int main()
{
    test1();
    return 0;
}