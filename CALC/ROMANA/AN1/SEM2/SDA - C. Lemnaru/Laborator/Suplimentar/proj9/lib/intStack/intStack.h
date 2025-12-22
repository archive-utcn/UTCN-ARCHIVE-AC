#pragma once

/**
 * Structure for storing a stack of integers.
 */
typedef struct _IntStack IntStack;

/**
 * Creates an empty stack, with no elements.
 * @return Reference to a newly allocated stack.
 */
IntStack *intStack_new();

/**
 * Frees all the memory used by the stack.
 * @param stack Reference to the stack.
 */
void intStack_free(IntStack *stack);

/**
 * Returns the number of elements in the stack
 * @param stack Reference to the stack.
 * @return The number of elements in the stack.
 * @exception If stack is NULL, 0 is returned.
 */
int intStack_size(IntStack *stack);

/**
 * Adds a value on top of the stack.
 * @param stack Reference to the stack.
 * @param value The value to be added.
 */
void intStack_push(IntStack *stack, int value);

/**
 * Removes an element from the top of the stack.
 * @param stack Reference to the stack.
 */
void intStack_pop(IntStack *stack);

/**
 * Gets the value from the top of the stack without removing it.
 * @param stack Reference to the stack.
 * @return A reference to the first element in the stack. If the stack is empty, NULL is returned.
 * @exception If stack is NULL, NULL is returned.
 */
int *intStack_peek(IntStack *stack);

/**
 * Removes all elements from the stack.
 * @param stack Reference to the stack.
 */
void intStack_clear(IntStack *stack);

/**
 * Checks if the stack contains the specified element.
 * @param stack Reference to the stack.
 * @param value The value to be searched.
 * @return 1 if the stack contains the value, 0 otherwise.
 */
int intStack_contains(IntStack *stack, int value);

/**
 * Iterates through elements of the stack and calls the given function with the element's reference as a parameter and the context.
 * @param stack Reference to the stack.
 * @param context Reference to a context to be passed to the function.
 * @param func Reference to a function to be called on each element.
 * The function should have the following signature:
 *   void func(int *value, void *context);
 */
void intArray_for_each(IntStack *stack, void *context, void (*func)(int *, void *));
