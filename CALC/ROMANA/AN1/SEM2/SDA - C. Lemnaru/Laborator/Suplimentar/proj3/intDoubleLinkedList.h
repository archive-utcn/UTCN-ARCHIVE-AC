#pragma once

/**
 * A struct representing a double-linked list for integers.
 */
typedef struct _IntDoubleLinkedList IntDoubleLinkedList;

/**
 * Creates an empty double-linked list for integers.
 * @return A pointer to the created empty double-linked list.
 */
IntDoubleLinkedList *intDoubleLinkedList_new();

/**
 * Frees the memory occupied by the double-linked list.
 * @param list A pointer to the double-linked list to be freed.
 */
void intDoubleLinkedList_free(IntDoubleLinkedList *list);

/**
 * Returns the number of elements in the double-linked list.
 * @param list A pointer to the double-linked list.
 * @return The number of elements in the double-linked list.
 * @exception If the double-linked list is NULL, 0 is returned.
 */
int intDoubleLinkedList_size(IntDoubleLinkedList *list);

/**
 * Returns a pointer to the first element in the double-linked list.
 * @param list A pointer to the double-linked list.
 * @return A pointer to the first element in the list. If the list is empty, NULL is returned.
 * @exception If the list is NULL, NULL is returned.
 */
int *intDoubleLinkedList_front(IntDoubleLinkedList *list);

/**
 * Returns a pointer to the last element in the double-linked list.
 * @param list A pointer to the double-linked list.
 * @return A pointer to the last element in the list. If the list is empty, NULL is returned.
 * @exception If the list is NULL, NULL is returned.
 */
int *intDoubleLinkedList_back(IntDoubleLinkedList *list);

/**
 * Adds a new value at the beginning of the double-linked list.
 * @param list A pointer to the double-linked list.
 * @param value The value to be added.
 */
void intDoubleLinkedList_push_front(IntDoubleLinkedList *list, int value);

/**
 * Removes the first element in the double-linked list.
 * @param list A pointer to the double-linked list.
 */
void intDoubleLinkedList_pop_front(IntDoubleLinkedList *list);

/**
 * Appends the specified element to the end of the double-linked list.
 * @param list A pointer to the double-linked list.
 * @param value The value to be added.
 */
void intDoubleLinkedList_push_back(IntDoubleLinkedList *list, int value);

/**
 * Removes the last element in the double-linked list.
 * @param list A pointer to the double-linked list.
 */
void intDoubleLinkedList_pop_back(IntDoubleLinkedList *list);

/**
 * Removes all elements from the double-linked list.
 * @param list A pointer to the double-linked list.
 */
void intDoubleLinkedList_clear(IntDoubleLinkedList *list);

/**
 * Removes all occurrences of the specified element from the double-linked list.
 * @param list A pointer to the double-linked list.
 * @param value The value to be removed.
 */
void intDoubleLinkedList_remove(IntDoubleLinkedList *list, int value);

/**
 * Inserts the specified element at the specified position in the double-linked list.
 * @param list A pointer to the double-inked list.
 * @param position The position at which to insert the element.
 * @param value The value to be added.
 */
void intDoubleLinkedList_push_at(IntDoubleLinkedList *list, unsigned position, int value);

/**
 * Checks if the list contains the specified element.
 * @param list A pointer to the double-inked list.
 * @param value The value to be searched.
 * @return 1 if the list contains the value, 0 otherwise.
 * @exception If the list is NULL, 0 is returned.
 */
int intDoubleLinkedList_contains(IntDoubleLinkedList *list, int value);

/**
 * Iterates through elements of the list and calls the provided function with the element's reference as a parameter.
 * @param list A pointer to the double-inked list.
 * @param context Reference to a context to be passed to the function.
 * @param func Reference to a function to be called.
 *
 * The function should have the following signature:
 *    void func(int *element, void *context)
 */
void intDoubleLinkedList_forEach(IntDoubleLinkedList *list, void *context, void (*func)(int *, void *));
