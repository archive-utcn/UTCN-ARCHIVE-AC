#pragma once

/**
 * Structure for storing an array that can change in size.
 */
typedef struct _Vector Vector;

/**
 * Creates an empty vector, with no elements.
 * @param elementSize The size of an element.
 * @return Reference to a vector.
 */
Vector *vector_new(unsigned elementSize);

/**
 * Frees all the memory used by the vector.
 * @param vector Reference to a vector.
 */
void vector_free(Vector *vector);

/**
 * Returns the number of elements in the vector.
 * @param vector Reference to a vector.
 * @return The number of elements in the vector. If vector is NULL, 0 is returned.
 */
unsigned vector_size(Vector *vector);

/**
 * Returns a reference to the element at a certain position in the vector.
 * @param vector Reference to a vector.
 * @param position Position of an element in the vector.
 * @return A reference to the element from the vector. If vector is NULL, NULL is returned. If position is outside the bounds of the vector, NULL is returned.
 */
void *vector_at(Vector *vector, unsigned position);

/**
 * Returns a reference to the first element in the vector.
 * @param vector Reference to a vector.
 * @return A reference to the first element in the vector. If the vector is empty, NULL is returned.
 */
void *vector_front(Vector *vector);

/**
 * Checks if a element is inside the vector.
 * @param vector Reference to a vector.
 * @param elementRef Reference to an element to be searched.
 * @param compareFunction Reference to a compare function. The function should return 0 if the elements are equal.
 * @return 1 if the vector contains the element, 0 otherwise. If the vector is empty, 0 is returned.
 */
int vector_contains(Vector *vector, void *elementRef, int (*compareFunction)(void *a, void *b));

/**
 * Adds a new value at the end of the vector. The function copies elementSize bytes from the elementRef.
 * @param vector Reference to a vector.
 * @param elementRef Reference to an element to be added.
 */
void vector_push_back(Vector *vector, void *elementRef);

/**
 * Inserts an element in the vector at the specified position. The function copies elementSize bytes from the elementRef.
 * @param vector Reference to a vector.
 * @param position Position in the vector where the new value is inserted. The position could be the next position after the last, meaning that this function could act like the vector_push_back.
 * @param elementRef Reference to an element to be added.
 */
void vector_insert(Vector *vector, unsigned position, void *elementRef);

/**
 * Removes from the vector a range of elements.
 * @param vector Reference to a vector.
 * @param first Position in the vector of the first element to be removed.
 * @param last Position in the vector of the last element to be removed.
 */
void vector_erase(Vector *vector, unsigned first, unsigned last);

/**
 * Removes all elements from the vector.
 * @param vector Reference to a vector.
 */
void vector_clear(Vector *vector);

/**
 * Iterates through elements of the vector and calls the func with the element's reference as a parameter.
 * @param vector Reference to a vector.
 * @param context Reference to a context to be passed to func as a parameter.
 * @param func Reference to a function to be called.
 */
void vector_forEach(Vector *vector, void *context, void (*func)(void *elementRef, void *context));