#include <stdlib.h>
#include <stdio.h>
#include "rocketBinarySearchTree.h"
#include <string.h>

#define treeEmptyPrecaution() \
    if (tree == NULL)       \
        return;

//////////////////// Racheta ////////////////////
typedef struct Racheta
{
    char nume[15];
    unsigned anul, putere;

    struct Racheta *left;
    struct Racheta *right;
} Racheta;

void add_nod(Racheta *nod, Racheta *new_nod)
{
    if (strcmp(new_nod->nume, nod->nume) < 0) // new_nod->data < nod->data)
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

void nod_free(Racheta *nod){
    if(nod == NULL) return;

    nod_free(nod->left);
    nod_free(nod->right);
    free(nod);
}

int nod_contains(Racheta *nod, char *nume)
{
    if (nod == NULL)
        return 0;

    if (strcmp(nod->nume, nume) == 0) // nod->data == value)
        return 1;

    if (nod_contains(nod->left, nume))
        return 1;
    else
        return nod_contains(nod->right, nume);
}

unsigned nod_count(Racheta *nod)
{
    if (nod == NULL)
        return 0;

    return 1 + nod_count(nod->left) + nod_count(nod->right);
}

void nod_contains_substring(Racheta *nod, char *nume, void (*func)(char *, unsigned *, unsigned *))
{
    if (nod == NULL)
        return;

    nod_contains_substring(nod->left, nume, func);
    if (strstr(nod->nume, nume) != 0)
        func(nod->nume, &(nod->anul), &(nod->putere));
    nod_contains_substring(nod->right, nume, func);
}

void nod_print(Racheta *nod)
{
    if (nod == NULL)
        return;

    nod_print(nod->left);
    printf("Nume: %s\nAnul fabricatiei: %d\nPuterea de propulsie: %d\n\n", nod->nume, nod->anul, nod->putere);
    nod_print(nod->right);
}

void nod_populate_list(Racheta *nod, Rocket *lista, int *index)
{
    if (nod == NULL)
        return;

    // inorder
    nod_populate_list(nod->left, lista, index);

    lista[*index].an = nod->anul;
    lista[*index].putere = nod->putere;
    strcpy(lista[*index].nume, nod->nume);
    (*index)++;

    nod_populate_list(nod->right, lista, index);
}

void nod_foreach(Racheta *nod, void (*func)(char *, unsigned *, unsigned *, void *), void *context)
{
    if (nod == NULL)
        return;

    // inorder
    nod_foreach(nod->left, func, context);
    func(nod->nume, &(nod->anul), &(nod->putere), context);
    nod_foreach(nod->right, func, context);
}

//////////////////// TREE ////////////////////
struct _RocketBinarySearchTree
{
    Racheta *radacina;
};

RocketBinarySearchTree *rocketBinarySearchTree_new()
{
    RocketBinarySearchTree *tree = (RocketBinarySearchTree *)malloc(sizeof(RocketBinarySearchTree));
    tree->radacina = NULL;
    return tree;
}

void rocketBinarySearchTree_free(RocketBinarySearchTree * tree)
{
    treeEmptyPrecaution();

    nod_free(tree->radacina);
    free(tree);
}

void rocketBinarySearchTree_add(RocketBinarySearchTree *tree, char *nume, unsigned an, unsigned putere)
{
    treeEmptyPrecaution();

    Racheta *nod = (Racheta *)malloc(sizeof(Racheta));
    nod->anul = an;
    nod->putere = putere;
    strcpy(nod->nume, nume);
    nod->left = nod->right = NULL;

    if (tree->radacina == NULL)
    {
        tree->radacina = nod;
        return;
    }

    add_nod(tree->radacina, nod);
}

int rocketBinarySearchTree_contains(RocketBinarySearchTree *tree, char *nume)
{
    if (tree == NULL)
        return 0;

    return nod_contains(tree->radacina, nume);
}

void rocketBinarySearchTree_contains_substring(
    RocketBinarySearchTree *tree,
    char *nume,
    void (*func)(char *, unsigned *, unsigned *))
{
    treeEmptyPrecaution();

    nod_contains_substring(tree->radacina, nume, func);
}

void rocketBinarySearchTree_forEach(RocketBinarySearchTree *tree, void (*func)(char *, unsigned *, unsigned *, void *), void *context)
{
    treeEmptyPrecaution();

    nod_foreach(tree->radacina, func, context);
}

void rocketBinarySearchTree_print(RocketBinarySearchTree *tree)
{
    treeEmptyPrecaution();

    nod_print(tree->radacina);
}

unsigned rocketBinarySearchTree_count(RocketBinarySearchTree *tree)
{ // folosit intern
    if (tree == NULL)
        return 0;

    return nod_count(tree->radacina);
}

Rocket *rocketBinarySearchTree_toList(RocketBinarySearchTree *tree)
{
    if (tree == NULL)
        return NULL;

    unsigned nods = nod_count(tree->radacina);
    if (nods == 0)
        return NULL;

    Rocket *rez = (Rocket *)malloc(sizeof(Rocket) * nods);
    int index = 0;
    nod_populate_list(tree->radacina, rez, &index);
    return rez;
}
