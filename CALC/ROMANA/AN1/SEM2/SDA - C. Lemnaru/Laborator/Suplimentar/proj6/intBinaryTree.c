#include <stdlib.h>
#include "intBinaryTree.h"

#define treeEmptyPrecaution \
    if (tree == NULL)       \
        return;

struct Nod
{
    int val;
    struct Nod *left;
    struct Nod *right;
};
typedef struct Nod Nod;

unsigned nod_size();
void nod_free();
void nod_add(Nod *, Nod *);

struct _IntBinaryTree
{
    Nod *radacina;
};

IntBinaryTree *intBinaryTree_new()
{
    IntBinaryTree *tree = malloc(sizeof(IntBinaryTree));
    if (tree == NULL)
        return NULL;

    tree->radacina = NULL;
    return tree;
}

void intBinaryTree_add(IntBinaryTree *tree, int value)
{
    treeEmptyPrecaution;

    Nod *nod = malloc(sizeof(Nod));
    if (nod == NULL)
        return;
    nod->val = value;
    nod->left = NULL;
    nod->right = NULL;

    if (tree->radacina == NULL)
    {
        tree->radacina = nod;
        return;
    }

    nod_add(tree->radacina, nod);
}

void nod_add(Nod *parent, Nod *nod)
{
    if (parent == NULL)
        return;

    if (parent->left == NULL)
    {
        parent->left = nod;
        return;
    }

    if (parent->right == NULL)
    {
        parent->right = nod;
        return;
    }

    Nod *min_nod = (nod_size(parent->left) <= nod_size(parent->right)) ? parent->left : parent->right;
    nod_add(min_nod, nod);
}

void nod_free(Nod *nod)
{
    if (nod == NULL)
        return;
    free(nod->left);
    free(nod->right);
    free(nod);
    nod = NULL;
}

void intBinaryTree_free(IntBinaryTree *tree)
{
    treeEmptyPrecaution;

    if (tree->radacina != NULL)
        nod_free(tree->radacina);

    free(tree);
    tree = NULL;
}

unsigned nod_size(Nod *nod)
{
    if (nod == NULL)
        return 0;

    return 1 + nod_size(nod->left) + nod_size(nod->right);
}

unsigned intBinaryTree_size(IntBinaryTree *tree)
{
    if (tree == NULL)
        return 0;
    return nod_size(tree->radacina);
}

// POSTORDER
void nod_postorder(Nod *nod, void *context, void (*func)(int *, void *))
{
    if (nod == NULL)
        return;

    nod_postorder(nod->left, context, func);
    nod_postorder(nod->right, context, func);
    func(&nod->val, context);
}

void intBinaryTree_postorder(IntBinaryTree *tree, void *context, void (*func)(int *, void *))
{
    treeEmptyPrecaution;

    nod_postorder(tree->radacina, context, func);
}

// INORDER
void nod_inorder(Nod *nod, void *context, void (*func)(int *, void *))
{
    if (nod == NULL)
        return;

    nod_inorder(nod->left, context, func);
    func(&nod->val, context);
    nod_inorder(nod->right, context, func);
}

void intBinaryTree_inorder(IntBinaryTree *tree, void *context, void (*func)(int *, void *))
{
    treeEmptyPrecaution;

    nod_inorder(tree->radacina, context, func);
}

// PREORDER
void nod_preorder(Nod *nod, void *context, void (*func)(int *, void *))
{
    if (nod == NULL)
        return;

    func(&nod->val, context);
    nod_preorder(nod->left, context, func);
    nod_preorder(nod->right, context, func);
}

void intBinaryTree_preorder(IntBinaryTree *tree, void *context, void (*func)(int *, void *))
{
    treeEmptyPrecaution;

    nod_preorder(tree->radacina, context, func);
}

unsigned count_leaves(Nod *nod)
{
    if (nod == NULL)
        return 0;

    if(nod->left == NULL && nod->right == NULL)
        return 1;

    return count_leaves(nod->left) + count_leaves(nod->right);
}

unsigned intBinaryTree_leafCount(IntBinaryTree *tree)
{
    if (tree == NULL)
        return 0;

    return count_leaves(tree->radacina);
}

unsigned height(Nod *nod){
    if(nod == NULL)
        return 0;

    unsigned left = height(nod->left);
    unsigned right = height(nod->right);

    return (left > right) ? left + 1 : right + 1;
}

unsigned intBinaryTree_height(IntBinaryTree *tree){
    if(tree == NULL)
        return 0;

    return height(tree->radacina);
}

typedef struct{
    int val;
    int hasValue;
} AuxContainsValue;

void nod_value(int *val, void* aux){
    AuxContainsValue *aux_cmp = (AuxContainsValue*)aux;

    if(*val == aux_cmp->val)
        aux_cmp->hasValue = 1;
}

int intBinaryTree_contains(IntBinaryTree *tree, int value){
    if(tree==NULL) return 0;

    AuxContainsValue aux;
    aux.val = value;
    aux.hasValue = 0;

    intBinaryTree_preorder(tree, &aux, nod_value);

    return aux.hasValue;
}
