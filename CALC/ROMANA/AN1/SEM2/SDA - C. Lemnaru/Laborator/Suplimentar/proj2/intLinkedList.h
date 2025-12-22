#pragma once

/**
 * A struct representing a linked list for integers.
 */
typedef struct IntLinkedList IntLinkedList;

/**
 * Creates an empty linked list for integers.
 * @return A pointer to the created empty linked list.
 */
IntLinkedList *intLinkedList_new();

/**
 * Frees the memory occupied by the linked list.
 * @param list A pointer to the linked list to be freed.
 */
void intLinkedList_free(IntLinkedList *list);

/**
 * Returns the number of elements in the linked list.
 * @param list A pointer to the linked list.
 * @return The number of elements in the linked list.
 * @exception If the linked list is NULL, 0 is returned.
 */
int intLinkedList_size(IntLinkedList *list);

/**
 * Returns a pointer to the first element in the linked list.
 * @param list A pointer to the linked list.
 * @return A pointer to the first element in the linked list. If the linked list is empty, NULL is returned.
 * @exception If the linked list is NULL, NULL is returned.
 */
int *intLinkedList_front(IntLinkedList *list);

/**
 * Returns a pointer to the last element in the linked list.
 * @param list A pointer to the linked list.
 * @return A pointer to the last element in the linked list. If the linked list is empty, NULL is returned.
 * @exception If the linked list is NULL, NULL is returned.
 */
int *intLinkedList_back(IntLinkedList *list);

/**
 * Adds a new value at the beginning of the linked list.
 * @param list A pointer to the linked list.
 * @param value The value to be added.
 */
void intLinkedList_push_front(IntLinkedList *list, int value);

/**
 * Removes the first element in the linked list.
 * @param list A pointer to the linked list.
 */
void intLinkedList_pop_front(IntLinkedList *list);

/**
 * Appends the specified element to the end of the linked list.
 * @param list A pointer to the linked list.
 * @param value The value to be added.
 */
void intLinkedList_push_back(IntLinkedList *list, int value);

/**
 * Removes the last element in the linked list.
 * @param list A pointer to the linked list.
 */
void intLinkedList_pop_back(IntLinkedList *list);

/**
 * Removes all elements from the linked list.
 * @param list A pointer to the linked list.
 */
void intLinkedList_clear(IntLinkedList *list);

/**
 * Removes all occurrences of the specified element from the linked list.
 * @param list A pointer to the linked list.
 * @param value The value to be removed.
 */
void intLinkedList_remove(IntLinkedList *list, int value);

/**
 * Inserts the specified element at the specified position in the linked list.
 * @param list A pointer to the linked list.
 * @param position The position at which to insert the element.
 * @param value The value to be added.
 */
void intLinkedList_push_at(IntLinkedList *list, unsigned position, int value);

/**
 * Checks if the list contains the specified element.
 * @param list Reference to a list.
 * @param value The value to be searched.
 * @return 1 if the list contains the value, 0 otherwise.
 * @exception If list is NULL, 0 is returned.
 */
int intLinkedList_contains(IntLinkedList *list, int value);

/**
 * Iterates through elements of the list and calls the provided function with the element's reference as a parameter.
 * @param list Reference to a list.
 * @param context Reference to a context to be passed to the function.
 * @param func Reference to a function to be called.
 *
 * The function should have the following signature:
 *    void func(int *element, void *context)
 */
void intLinkedList_forEach(IntLinkedList *list, void *context, void (*func)(int *, void *));
