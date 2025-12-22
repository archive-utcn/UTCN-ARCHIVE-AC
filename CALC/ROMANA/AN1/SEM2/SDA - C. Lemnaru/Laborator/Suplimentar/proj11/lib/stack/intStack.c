#include <stdlib.h>
#include <stdio.h>
#include <intStack.h>

#define stackEmptyPrecaution \
    if (stack == NULL)       \
        return;

struct Nod
{
    int data;
    struct Nod *next;
};
typedef struct Nod Nod;

struct _IntStack
{
    Nod *top;
};

IntStack *intStack_new()
{
    IntStack *s = (IntStack *)malloc(sizeof(IntStack));
    s->top = NULL;
    return s;
}

void intStack_clear(IntStack *stack)
{
    stackEmptyPrecaution;

    Nod *p = stack->top;
    while (p != NULL)
    {
        Nod *q = p;
        p = p->next;
        free(q);
    }
    stack->top = NULL;
}

void intStack_free(IntStack *stack)
{
    stackEmptyPrecaution;

    intStack_clear(stack);
    free(stack);
    stack = NULL;
}

int intStack_size(IntStack *stack)
{
    if (stack == NULL)
        return 0;

    int size = 0;
    Nod *p = stack->top;
    while (p != NULL)
    {
        size++;
        p = p->next;
    }
    return size;
}

void intStack_push(IntStack *stack, int data)
{
    stackEmptyPrecaution;

    Nod *p = (Nod *)malloc(sizeof(Nod));
    p->data = data;

    if (stack->top == NULL)
        p->next = NULL;
    else
        p->next = stack->top;

    stack->top = p;
}

void intStack_pop(IntStack *stack)
{
    stackEmptyPrecaution;

    Nod *p = stack->top;
    stack->top = p->next;
    free(p);
}

int *intStack_peek(IntStack *stack)
{
    if (stack == NULL)
        return 0;
    if (stack->top == NULL)
        return 0;

    return &stack->top->data;
}

int intStack_contains(IntStack *stack, int value){
    if(stack == NULL)
        return 0;
    if(stack->top == NULL)
        return 0;

    Nod *p = stack->top;
    while(p != NULL){
        if(p->data == value)
            return 1;
        p = p->next;
    }
    return 0;
}

void intStack_for_each(IntStack *stack, void *context, void (*func)(void *context, int *data))
{
    if (stack == NULL)
        return;
    if (stack->top == NULL)
        return;

    Nod *p = stack->top;
    while (p != NULL)
    {
        func(context, &p->data);
        p = p->next;
    }
}
