#include <stdlib.h>
#include <stdio.h>
#include "intDoubleLinkedList.h"

void pr(int *elm, void *_)
{
    printf("%d, ", *elm);
}

void test1()
{
    printf("%s:\n", __FUNCTION__);

    IntDoubleLinkedList *lista = intDoubleLinkedList_new();
    intDoubleLinkedList_push_back(lista, 1);
    intDoubleLinkedList_push_back(lista, 2);
    intDoubleLinkedList_push_back(lista, 3);
    intDoubleLinkedList_push_back(lista, 4);
    intDoubleLinkedList_push_back(lista, 5);
    intDoubleLinkedList_push_at(lista, 3, -1);

    intDoubleLinkedList_push_front(lista, 10);
    printf("Size: %d\n", intDoubleLinkedList_size(lista));
    intDoubleLinkedList_forEach(lista, NULL, pr);
    intDoubleLinkedList_pop_front(lista);
    intDoubleLinkedList_pop_back(lista);
    printf("\n");
    intDoubleLinkedList_forEach(lista, NULL, pr);
    intDoubleLinkedList_free(lista);

    printf("\nSucces!\n");
}

int main()
{
    test1();
    return 0;
}