#pragma once

/**
 * Structure for storing a binary tree.
 */
typedef struct _IntBinaryTree IntBinaryTree;

/**
 * Creates a new binary tree with no elements.
 * @return A reference to the newly created binary tree.
 */
IntBinaryTree *intBinaryTree_new();

/**
 * Frees all memory used by the binary tree.
 * @param tree A reference to the binary tree to be freed.
 */
void intBinaryTree_free(IntBinaryTree *tree);

/**
 * Inserts a value into the binary tree as a leaf.
 * @param tree A reference to the binary tree.
 * @param value The value to be added to the binary tree.
 */
void intBinaryTree_add(IntBinaryTree *tree, int value);

/**
 * Iterates through elements of the binary tree in preorder (Root-L-R).
 * @param tree A reference to the binary tree.
 * @param context A reference to a context to be passed to the function.
 * @param func A reference to a function to be applied on each element.
 *             The function should have the following signature:
 *             void func(int *value, void *context);
 */
void intBinaryTree_preorder(IntBinaryTree *tree, void *context, void (*func)(int *, void *));

/**
 * Iterates through elements of the binary tree in inorder (L-Root-R).
 * @param tree A reference to the binary tree.
 * @param context A reference to a context to be passed to the function.
 * @param func A reference to a function to be applied on each element.
 *             The function should have the following signature:
 *             void func(int *value, void *context);
 */
void intBinaryTree_inorder(IntBinaryTree *tree, void *context, void (*func)(int *, void *));

/**
 * Iterates through elements of the binary tree in postorder (L-R-Root).
 * @param tree A reference to the binary tree.
 * @param context A reference to a context to be passed to the function.
 * @param func A reference to a function to be applied on each element.
 *             The function should have the following signature:
 *             void func(int *value, void *context);
 */
void intBinaryTree_postorder(IntBinaryTree *tree, void *context, void (*func)(int *, void *));

/**
 * Returns the number of elements in the binary tree.
 * @param tree A reference to the binary tree.
 * @return The number of elements in the binary tree.
 */
unsigned intBinaryTree_size(IntBinaryTree *tree);

/**
 * Returns the number of leaf elements in the binary tree.
 * @param tree A reference to the binary tree.
 * @return The number of leaf elements in the binary tree.
 */
unsigned intBinaryTree_leafCount(IntBinaryTree *tree);

/**
 * Returns the height of the binary tree.
 * @param tree A reference to the binary tree.
 * @return The height of the binary tree.
 */
unsigned intBinaryTree_height(IntBinaryTree *tree);

/**
 * Checks if the binary tree contains the specified element.
 * @param tree A reference to the binary tree.
 * @param value The value to be searched for in the binary tree.
 * @return 1 if the binary tree contains the value, 0 otherwise.
 */
int intBinaryTree_contains(IntBinaryTree *tree, int value);
