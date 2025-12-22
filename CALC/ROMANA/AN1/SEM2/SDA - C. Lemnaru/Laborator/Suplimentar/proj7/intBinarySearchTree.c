#include <stdlib.h>
#include "intBinarySearchTree.h"

#define treeEmptyPrecaution \
    if (tree == NULL)       \
        return;

//////////////////// NOD ////////////////////
struct Nod
{
    int data;
    struct Nod *left;
    struct Nod *right;
};
typedef struct Nod Nod;

void free_nod(Nod *nod)
{
    if (nod->left != NULL)
        free_nod(nod->left);
    if (nod->right != NULL)
        free_nod(nod->right);
    free(nod);
    nod = NULL;
}

void add_nod(Nod *nod, Nod *new_nod)
{
    if (new_nod->data < nod->data)
    {
        if (nod->left == NULL)
        {
            nod->left = new_nod;
            return;
        }
        add_nod(nod->left, new_nod);
    }
    else
    {
        if (nod->right == NULL)
        {
            nod->right = new_nod;
            return;
        }
        add_nod(nod->right, new_nod);
    }
}

void remove_nod(Nod *nod, int value)
{
    if (nod->data == value)
    {
        if (nod->left == NULL && nod->right == NULL)
        {
            free(nod);
            nod = NULL;
            return;
        }
        if (nod->left == NULL)
        {
            Nod *aux = nod->right;
            free(nod);
            nod = aux;
            return;
        }
        if (nod->right == NULL)
        {
            Nod *aux = nod->left;
            free(nod);
            nod = aux;
            return;
        }
        Nod *aux = nod->right;
        while (aux->left != NULL)
        {
            aux = aux->left;
        }
        nod->data = aux->data;
        remove_nod(nod->right, aux->data);
        return;
    }
    if (value < nod->data)
    {
        if (nod->left == NULL)
        {
            return;
        }
        remove_nod(nod->left, value);
    }
    else
    {
        if (nod->right == NULL)
        {
            return;
        }
        remove_nod(nod->right, value);
    }
}

void nod_preorder(Nod *nod, void *context, void (*func)(int *, void *))
{
    func(&nod->data, context);
    if (nod->left != NULL)
        nod_preorder(nod->left, context, func);
    if (nod->right != NULL)
        nod_preorder(nod->right, context, func);
}

void nod_inorder(Nod *nod, void *context, void (*func)(int *, void *))
{
    if (nod->left != NULL)
        nod_inorder(nod->left, context, func);
    func(&nod->data, context);
    if (nod->right != NULL)
        nod_inorder(nod->right, context, func);
}

void nod_postorder(Nod *nod, void *context, void (*func)(int *, void *))
{
    if (nod->left != NULL)
        nod_postorder(nod->left, context, func);
    if (nod->right != NULL)
        nod_postorder(nod->right, context, func);
    func(&nod->data, context);
}

unsigned leafCount_func(Nod *nod)
{
    if (nod == NULL)
        return 0;

    if (nod->left == NULL && nod->right == NULL)
        return 1;

    return leafCount_func(nod->left) + leafCount_func(nod->right);
}

unsigned nod_size(Nod *nod)
{
    if (nod == NULL)
        return 0;

    return 1 + nod_size(nod->left) + nod_size(nod->right);
}

int nod_contains(Nod *nod, int value)
{
    if (nod == NULL)
        return 0;

    if (nod->data == value)
        return 1;

    if (nod_contains(nod->left, value))
        return 1;
    else
        return nod_contains(nod->right, value);
}

unsigned nod_height(Nod *nod)
{
    if (nod == NULL)
        return 0;

    unsigned left = nod_height(nod->left);
    unsigned right = nod_height(nod->right);

    return (left > right) ? left + 1 : right + 1;
}

//////////////////// TREE ////////////////////
struct _IntBinarySearchTree
{
    Nod *radacina;
};

IntBinarySearchTree *intBinarySearchTree_new()
{
    IntBinarySearchTree *tree = (IntBinarySearchTree *)malloc(sizeof(IntBinarySearchTree));
    tree->radacina = NULL;
    return tree;
}

void intBinarySearchTree_free(IntBinarySearchTree *tree)
{
    treeEmptyPrecaution;
    if (tree->radacina != NULL)
        free_nod(tree->radacina);
    free(tree);
    tree = NULL;
}

void intBinarySearchTree_add(IntBinarySearchTree *tree, int value)
{
    treeEmptyPrecaution;

    Nod *nod = (Nod *)malloc(sizeof(Nod));
    nod->data = value;
    nod->left = nod->right = NULL;

    if (tree->radacina == NULL)
    {
        tree->radacina = nod;
        return;
    }

    add_nod(tree->radacina, nod);
}

void intBinarySearchTree_remove(IntBinarySearchTree *tree, int value)
{
    treeEmptyPrecaution;

    if (tree->radacina == NULL)
        return;

    remove_nod(tree->radacina, value);
}

void intBinarySearchTree_preorder(IntBinarySearchTree *tree, void *context, void (*func)(int *, void *))
{
    treeEmptyPrecaution;

    if (tree->radacina == NULL)
        return;
    nod_preorder(tree->radacina, context, func);
}

void intBinarySearchTree_inorder(IntBinarySearchTree *tree, void *context, void (*func)(int *, void *))
{
    treeEmptyPrecaution;

    if (tree->radacina == NULL)
        return;
    nod_inorder(tree->radacina, context, func);
}

void intBinarySearchTree_postorder(IntBinarySearchTree *tree, void *context, void (*func)(int *, void *))
{
    treeEmptyPrecaution;

    if (tree->radacina == NULL)
        return;
    nod_postorder(tree->radacina, context, func);
}

unsigned intBinarySearchTree_leafCount(IntBinarySearchTree *tree)
{
    if (tree == NULL)
        return 0;

    return leafCount_func(tree->radacina);
}

unsigned intBinarySearchTree_size(IntBinarySearchTree *tree)
{
    if (tree == NULL)
        return 0;

    return nod_size(tree->radacina);
}

int intBinarySearchTree_contains(IntBinarySearchTree *tree, int value)
{
    if (tree == NULL)
        return 0;

    return nod_contains(tree->radacina, value);
}

unsigned intBinarySearchTree_height(IntBinarySearchTree *tree)
{
    if (tree == NULL)
        return 0;

    return nod_height(tree->radacina);
}
