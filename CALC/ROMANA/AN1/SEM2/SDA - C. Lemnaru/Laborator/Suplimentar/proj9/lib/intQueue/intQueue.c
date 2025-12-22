#include <stdlib.h>
#include <stdio.h>
#include <intQueue.h>

#define queueEmptyPrecaution \
    if (queue == NULL)       \
        return;

struct Nod
{
    int value;
    struct Nod *next;
};
typedef struct Nod Nod;

struct _IntQueue
{
    Nod *head, *tail;
};

IntQueue *intQueue_new()
{
    IntQueue *queue = (IntQueue *)malloc(sizeof(IntQueue));
    queue->head = queue->tail = NULL;
    return queue;
}

void intQueue_clear(IntQueue *queue)
{
    queueEmptyPrecaution;

    Nod *p = queue->head;
    while (p != NULL)
    {
        Nod *t = p;
        p = p->next;
        free(t);
    }
}

void intQueue_free(IntQueue *queue)
{
    queueEmptyPrecaution;

    intQueue_clear(queue);
    free(queue);
}

int intQueue_size(IntQueue *queue)
{
    if (queue == NULL)
        return 0;
    if (queue->head == NULL)
        return 0;

    int size = 0;
    Nod *p = queue->head;
    while (p != NULL)
    {
        size++;
        p = p->next;
    }
    return size;
}

void intQueue_enqueue(IntQueue *queue, int value)
{
    queueEmptyPrecaution;

    Nod *nod_to_add = (Nod *)malloc(sizeof(Nod));
    if (nod_to_add == NULL)
        return;

    nod_to_add->value = value;
    nod_to_add->next = NULL;

    if (queue->head == NULL)
        queue->head = queue->tail = nod_to_add;
    else
    {
        queue->tail->next = nod_to_add;
        queue->tail = nod_to_add;
    }
}

void intQueue_dequeue(IntQueue *queue)
{
    queueEmptyPrecaution;

    if (queue->head == NULL)
        return;

    Nod *nod_to_remove = queue->head;
    queue->head = queue->head->next;
    free(nod_to_remove);
}

int *intQueue_peek(IntQueue *queue)
{
    if (queue == NULL)
        return NULL;
    if (queue->head == NULL)
        return NULL;

    return &(queue->head->value);
}

int intQueue_contains(IntQueue *queue, int value)
{
    if (queue == NULL)
        return 0;
    if (queue->head == NULL)
        return 0;

    Nod *p = queue->head;
    while (p != NULL)
    {
        if (p->value == value)
            return 1;
        p = p->next;
    }
    return 0;
}

void intQueue_forEach(IntQueue *queue, void *context, void (*func)(int *, void *))
{
    queueEmptyPrecaution;

    Nod *p = queue->head;
    while (p != NULL)
    {
        func(&p->value, context);
        p = p->next;
    }
}
