#include <stdlib.h>
#include <stdio.h>
#include "intDoubleLinkedList.h"

#define emptyListPrecaution \
    if (list == NULL)       \
        return;

struct Nod
{
    int value;
    struct Nod *next, *prev;
};
typedef struct Nod Nod;

struct _IntDoubleLinkedList
{
    Nod *head, *tail;
};

IntDoubleLinkedList *intDoubleLinkedList_new()
{
    IntDoubleLinkedList *list = (IntDoubleLinkedList *)malloc(sizeof(IntDoubleLinkedList));
    if (list == NULL)
        return NULL;

    list->head = list->tail = NULL;
    return list;
}

void intDoubleLinkedList_free(IntDoubleLinkedList *list)
{
    emptyListPrecaution;

    intDoubleLinkedList_clear(list);
    free(list);
    list = NULL;
}

int intDoubleLinkedList_size(IntDoubleLinkedList *list)
{
    if (list == NULL)
        return 0;
    if (list->head == NULL)
        return 0;

    Nod *nod = list->head;
    int c = 1;
    while (nod != list->tail)
    {
        nod = nod->next;
        c++;
    }
    return c;
}

int *IntDoubleLinkedList_front(IntDoubleLinkedList *list)
{
    if (list == NULL)
        return NULL;
    if (list->head == NULL)
        return NULL;
    return &list->head->value;
}

int *IntDoubleLinkedList_back(IntDoubleLinkedList *list)
{
    if (list == NULL)
        return NULL;
    if (list->tail == NULL)
        return NULL;
    return &list->tail->value;
}

void intDoubleLinkedList_push_front(IntDoubleLinkedList *list, int value)
{
    emptyListPrecaution;
    Nod *nod = (Nod *)malloc(sizeof(Nod));
    if (nod == NULL)
        return;

    nod->value = value;
    nod->prev = NULL;

    if (list->head == NULL)
    {
        nod->next = NULL;
        list->head = list->tail = nod;
        return;
    }

    nod->next = list->head;
    list->head->prev = nod;
    list->head = nod;
}

void intDoubleLinkedList_push_back(IntDoubleLinkedList *list, int value)
{
    emptyListPrecaution;

    Nod *nod = (Nod *)malloc(sizeof(Nod));
    if (nod == NULL)
        return;

    nod->value = value;
    nod->next = NULL;

    if (list->head == NULL)
    {
        nod->prev = NULL;
        list->head = list->tail = nod;
        return;
    }

    nod->prev = list->tail;
    list->tail->next = nod;
    list->tail = nod;
}

void intDoubleLinkedList_pop_front(IntDoubleLinkedList *list)
{
    emptyListPrecaution;

    if (list->head == NULL)
        return;

    if (list->head->next == NULL)
    {
        free(list->head);
        list->head = list->tail = NULL;
        return;
    }

    list->head = list->head->next;
    free(list->head->prev);
    list->head->prev = NULL;
}

void intDoubleLinkedList_pop_back(IntDoubleLinkedList *list)
{
    emptyListPrecaution;

    if (list->head == NULL)
        return;

    if (list->head->next == NULL)
    {
        free(list->head);
        list->head = list->tail = NULL;
        return;
    }

    list->tail = list->tail->prev;
    free(list->tail->next);
    list->tail->next = NULL;
}

void intDoubleLinkedList_clear(IntDoubleLinkedList *list)
{
    emptyListPrecaution;

    if (list->head == list->tail && list->head != NULL)
    {
        free(list->head);
        list->head = list->tail = NULL;
        return;
    }

    Nod *nod = list->head;
    while (nod != list->tail)
    {
        if (nod->prev != NULL)
            free(nod->prev);
        nod = nod->next;
    }
    free(nod);

    list->head = list->tail = NULL;
}

void intDoubleLinkedList_remove(IntDoubleLinkedList *list, int value)
{
    emptyListPrecaution;

    Nod *nod = list->head;
    while (nod != NULL)
    {
        if (nod->value == value)
        {
            if (nod->prev == NULL)
                list->head = nod->next;
            if (nod->next == NULL)
                list->tail = nod->prev;
            if (list->head != list->tail)
            {
                nod->prev->next = nod->next;
                nod->next->prev = nod->prev;
            }
            free(nod);
        }
        nod = nod->next;
    }
}

void intDoubleLinkedList_push_at(IntDoubleLinkedList *list, unsigned position, int value)
{
    emptyListPrecaution;

    Nod *nod_to_add = (Nod *)malloc(sizeof(Nod));
    if (nod_to_add == NULL)
        return;

    nod_to_add->value = value;

    if (list->head == NULL) // lista goala
    {
        nod_to_add->next = nod_to_add->prev = NULL;
        list->head = list->tail = nod_to_add;
        return;
    }

    Nod *nod = list->head;
    while (position != 0 && nod->next != NULL) // mergem la pozitie
    {
        nod = nod->next;
        position--;
    }

    if (nod == list->tail) // la final
    {
        nod->next = NULL;
        nod->prev = list->tail;
        list->tail = nod;
        return;
    }

    // altundeva in interior
    nod->prev->next = nod_to_add;
    nod_to_add->prev = nod->prev;
    nod_to_add->next = nod;
    nod->prev = nod_to_add;
}

int intDoubleLinkedList_contains(IntDoubleLinkedList *list, int value)
{
    if (list == NULL)
        return 0;
    if (list->head == NULL)
        return 0;

    Nod *nod = list->head;
    while (nod)
    {
        if (nod->value == value)
            return 1;
        nod = nod->next;
    }
    return 0;
}

void intDoubleLinkedList_forEach(IntDoubleLinkedList *list, void *context, void (*func)(int *, void *))
{
    emptyListPrecaution;

    if (list->head == NULL)
        return;

    Nod *nod = list->head;
    while (nod)
    {
        func(&nod->value, context);
        nod = nod->next;
    }
}
