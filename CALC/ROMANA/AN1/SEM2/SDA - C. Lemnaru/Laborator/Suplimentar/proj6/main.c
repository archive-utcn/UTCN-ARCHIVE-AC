#include <stdio.h>
#include <stdlib.h>
#include "intBinaryTree.h"

void printTree(int *value, void * context){
    printf("%d ", *value);
}

void test1(){
    printf("%s\n", __FUNCTION__);

    IntBinaryTree *tree = intBinaryTree_new();
    intBinaryTree_add(tree,1);
    intBinaryTree_add(tree,2);
    intBinaryTree_add(tree,3);
    intBinaryTree_add(tree,4);
    intBinaryTree_add(tree,4);
    intBinaryTree_add(tree,4);
    intBinaryTree_preorder(tree, NULL, printTree); printf("\n");
    intBinaryTree_inorder(tree, NULL, printTree); printf("\n");
    intBinaryTree_postorder(tree, NULL, printTree); printf("\n");
    printf("Leaves: %d\n", intBinaryTree_leafCount(tree));
    printf("Contains value: %d\n", intBinaryTree_contains(tree, 2));
    printf("Inaltimea arborelui: %d\n", intBinaryTree_height(tree));
    intBinaryTree_free(tree);


    printf("\nSucces!\n");
}

int main(){
    test1();
    return 0;
}