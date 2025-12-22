#include <stdio.h>
#include <stdlib.h>
#include <intStack.h>

void printVec(void *context, int *elm)
{
    printf("%d ", *elm);
}

void printStack(IntStack *arr)
{
    printf("Vec: ");
    intStack_for_each(arr, NULL, printVec);
    printf("\n");
}

void solveHanoi(IntStack *a1, IntStack *a2, IntStack *a3, int sz)
{
    // from a1 to a3
    if (sz == 1)
    {
        int elm = *intStack_peek(a1);
        intStack_pop(a1);
        intStack_push(a3, elm);
        return;
    }

    solveHanoi(a1, a3, a2, sz - 1);
    solveHanoi(a1, a2, a3, 1);
    solveHanoi(a2, a1, a3, sz - 1);
}

// hanoi
int main()
{
    IntStack *h1 = intStack_new(), *h2 = intStack_new(), *h3 = intStack_new();
    intStack_push(h1, 10);
    intStack_push(h1, 6);
    intStack_push(h1, 100);
    intStack_push(h1, 2);
    intStack_push(h1, 1);

    printf("Before hanoi:\n");
    printStack(h1);
    printStack(h2);
    printStack(h3);

    solveHanoi(h1, h2, h3, intStack_size(h1));

    printf("\nAfter hanoi:\n");
    printStack(h1);
    printStack(h2);
    printStack(h3);

    return 0;
}