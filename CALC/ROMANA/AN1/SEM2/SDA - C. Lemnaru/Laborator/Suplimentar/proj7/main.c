#include <stdlib.h>
#include <stdio.h>
#include "intBinarySearchTree.h"

void print(int *val, void *context)
{
    printf("%d ", *val);
}

void test1()
{
    printf("\nTest %s:\n", __FUNCTION__);

    IntBinarySearchTree *tree = intBinarySearchTree_new();
    intBinarySearchTree_add(tree, 10);
    intBinarySearchTree_add(tree, 0);
    intBinarySearchTree_add(tree, 8);
    intBinarySearchTree_add(tree, 1);
    intBinarySearchTree_add(tree, 15);
    intBinarySearchTree_add(tree, 20);
    intBinarySearchTree_add(tree, 2);

    printf("Inorder: ");
    intBinarySearchTree_inorder(tree, NULL, print);
    printf("\nPostorder: ");
    intBinarySearchTree_postorder(tree, NULL, print);
    printf("\nPreorder: ");
    intBinarySearchTree_preorder(tree, NULL, print);

    printf("\nSize: %d\n", intBinarySearchTree_size(tree));
    printf("\nLeaf count: %d\n", intBinarySearchTree_leafCount(tree));
    printf("\nHeight: %d\n", intBinarySearchTree_height(tree));

    printf("\nContine %d: %d", 20, intBinarySearchTree_contains(tree, 20));

    // intBinarySearchTree_free(tree);

    printf("\nSucces!\n");
}

void test2()
{
    printf("\nTest %s:\n", __FUNCTION__);

    IntBinarySearchTree *tree = intBinarySearchTree_new();
    intBinarySearchTree_add(tree, 15);
    printf("Marime: %d", intBinarySearchTree_height(tree));
    intBinarySearchTree_free(tree);

    printf("\nSucces!\n");
}

int main()
{
    test1();
    test2();
    return 0;
}