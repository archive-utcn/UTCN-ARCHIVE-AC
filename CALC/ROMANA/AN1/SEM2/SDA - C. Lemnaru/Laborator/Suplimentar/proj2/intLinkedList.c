#include <stdlib.h>
#include <stdio.h>
#define listNullProtection \
    {                      \
        if (list == NULL)  \
            return;        \
    }
#include "intLinkedList.h"

typedef struct Nod
{
    int val;
    struct Nod *next;
} Nod;

struct IntLinkedList
{
    Nod *first, *last;
};

IntLinkedList *intLinkedList_new()
{
    IntLinkedList *list = malloc(sizeof(IntLinkedList));
    if(list == NULL)
        return NULL;

    list->first = NULL;
    list->last = NULL;

    return list;
}

void intLinkedList_push_back(IntLinkedList *list, int value)
{
    listNullProtection;

    Nod *nod = malloc(sizeof(Nod));
    nod->val = value;
    nod->next = NULL;

    if (list->first == NULL)
        list->first = nod;
    else
        list->last->next = nod;

    list->last = nod;
}

void intLinkedList_free(IntLinkedList *list)
{
    listNullProtection;

    Nod *nod = list->first;
    while (nod != NULL)
    {
        Nod *aux = nod;
        nod = nod->next;
        free(aux);
    }

    free(list);
}

int intLinkedList_size(IntLinkedList *list)
{
    if (list == NULL)
        return 0;

    if (list->first == NULL)
        return 0;

    int size = 0;
    for (Nod *nod = list->first; nod != NULL; nod = nod->next)
        size++;

    return size;
}

int *intLinkedList_front(IntLinkedList *list)
{
    if (list == NULL)
        return 0;

    if (list->first == NULL)
        return 0;

    return &list->first->val;
}

int *intLinkedList_back(IntLinkedList *list)
{
    if (list == NULL)
        return 0;

    if (list->first == NULL)
        return 0;

    return &list->last->val;
}

void intLinkedList_push_front(IntLinkedList *list, int value)
{
    listNullProtection;

    Nod *nod = malloc(sizeof(Nod));
    nod->val = value;
    nod->next = list->first;

    if (list->first == NULL)
        list->last = nod;

    list->first = nod;
}

void intLinkedList_pop_front(IntLinkedList *list)
{
    listNullProtection;

    if (list->first == NULL)
        return;

    Nod *nod = list->first;
    list->first = nod->next;
    free(nod);

    if(list->first == NULL)
        list->last = NULL;
}

void intLinkedList_pop_back(IntLinkedList *list)
{
    listNullProtection;

    if (list->first == NULL)
        return;

    if (list->first == list->last)
    {
        free(list->first);
        list->first = NULL;
        list->last = NULL;
        return;
    }

    Nod *nod = list->first;
    while (nod->next != list->last)
        nod = nod->next;

    free(list->last);
    list->last = nod;
    nod->next = NULL;
}

void intLinkedList_clear(IntLinkedList *list)
{
    listNullProtection;

    Nod *nod = list->first;
    while (nod != NULL)
    {
        Nod *aux = nod;
        nod = nod->next;
        free(aux);
    }

    list->first = NULL;
    list->last = NULL;
}

void intLinkedList_remove(IntLinkedList *list, int value)
{
    listNullProtection;

    if (list->first == NULL)
        return;

    while (list->first != NULL)
        if (list->first->val == value)
            intLinkedList_pop_front(list);
        else
            break;

    if (list->first == NULL)
        return;

    Nod *nod = list->first;
    while (nod->next != NULL)
    {
        if (nod->next->val == value)
        {
            Nod *aux = nod->next;
            nod->next = aux->next;
            free(aux);
        }
        else
            nod = nod->next;
    }
    list->last = nod;
}

void intLinkedList_push_at(IntLinkedList *list, unsigned position, int value){
    listNullProtection;

    if(position == 0){
        intLinkedList_push_front(list, value);
        return;
    }

    Nod *nod = list->first;
    while(nod != NULL && position != 1){
        nod = nod->next;
        position--;
    }

    if(nod == NULL){
        intLinkedList_push_back(list, value);
        return;
    }

    Nod *newNod = malloc(sizeof(Nod));
    newNod->val = value;
    newNod->next = nod->next;
    nod->next = newNod;
}

int intLinkedList_contains(IntLinkedList *list, int value){
    if(list == NULL)
        return 0;

    for(Nod *nod = list->first; nod != NULL; nod = nod->next)
        if(nod->val == value)
            return 1;

    return 0;
}

void intLinkedList_forEach(IntLinkedList *list, void *context, void (*func)(int *, void *))
{
    listNullProtection;

    for (Nod *nod = list->first; nod != NULL; nod = nod->next)
        func(&nod->val, context);
}
