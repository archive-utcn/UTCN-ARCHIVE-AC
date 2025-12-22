#pragma once

/**
 * Structure for storing a binary search tree (BST).
 */
typedef struct _IntBinarySearchTree IntBinarySearchTree;

/**
 * Creates an empty BST, with no elements.
 * @return Reference to a tree
 */
IntBinarySearchTree *intBinarySearchTree_new();

/**
 * Frees all memory used by the tree.
 * @param tree A reference to the BST to be freed.
 */
void intBinarySearchTree_free(IntBinarySearchTree *tree);

/**
 * Inserts a value into a BST.
 * @param tree A reference to the BST.
 * @param value Value to be added.
 */
void intBinarySearchTree_add(IntBinarySearchTree *tree, int value);

/**
 * Removes a value from a BST.
 * @param tree A reference to the BST.
 * @param value Value to be added.
 */
void intBinarySearchTree_remove(IntBinarySearchTree *tree, int value);

/**
 * Iterates through elements of the tree in preorder. (Root-L-R)
 * @param tree A reference to the BST.
 * @param context A reference to a context to be passed to the function.
 * @param func A reference to a function to be applied on each element.
 *             The function should have the following signature:
 *             void func(int *value, void *context);
 */
void intBinarySearchTree_preorder(IntBinarySearchTree *tree, void *context, void (*func)(int *, void *));

/**
 * Iterates through elements of the tree in inorder. (L-Root-R)
 * @param tree A reference to the BST.
 * @param context A reference to a context to be passed to the function.
 * @param func A reference to a function to be applied on each element.
 *             The function should have the following signature:
 *             void func(int *value, void *context);
 */
void intBinarySearchTree_inorder(IntBinarySearchTree *tree, void *context, void (*func)(int *, void *));

/**
 * Iterates through elements of the tree in postorder. (L-R-Root)
 * @param tree A reference to the BST.
 * @param context A reference to a context to be passed to the function.
 * @param func A reference to a function to be applied on each element.
 *             The function should have the following signature:
 *             void func(int *value, void *context);
 */
void intBinarySearchTree_postorder(IntBinarySearchTree *tree, void *context, void (*func)(int *, void *));

/**
 * Returns the number of elements in the tree.
 * @param tree A reference to the BST.
 * @return The number of elements in the tree.
 */
unsigned intBinarySearchTree_size(IntBinarySearchTree *tree);

/**
 * Returns the number of leaf elements in the tree.
 * @param tree A reference to the BST.
 * @return The number of leaf elements in the tree.
 */
unsigned intBinarySearchTree_leafCount(IntBinarySearchTree *tree);

/**
 * Returns the height of the tree.
 * @param tree A reference to the BST.
 * @return The height of the tree.
 */
unsigned intBinarySearchTree_height(IntBinarySearchTree *tree);

/**
 * Checks if the tree contains the specified element.
 * @param tree A reference to the BST.
 * @param value The value to be searched.
 * @return 1 if the tree contains the value, 0 otherwise.
 */
int intBinarySearchTree_contains(IntBinarySearchTree *tree, int value);
