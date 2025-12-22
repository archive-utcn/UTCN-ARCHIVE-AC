#pragma once

typedef struct _RocketBinarySearchTree RocketBinarySearchTree;
typedef struct
{
    char nume[15];
    unsigned an, putere;
} Rocket;

RocketBinarySearchTree *rocketBinarySearchTree_new();

void rocketBinarySearchTree_add(RocketBinarySearchTree *, char *, unsigned, unsigned);

void rocketBinarySearchTree_free(RocketBinarySearchTree *);

int rocketBinarySearchTree_contains(RocketBinarySearchTree *, char *);

void rocketBinarySearchTree_contains_substring(RocketBinarySearchTree *, char *, void (*)(char *, unsigned *, unsigned *));

void rocketBinarySearchTree_print(RocketBinarySearchTree *);

Rocket *rocketBinarySearchTree_toList(RocketBinarySearchTree *);

unsigned rocketBinarySearchTree_count(RocketBinarySearchTree *);

void rocketBinarySearchTree_forEach(RocketBinarySearchTree *, void (*)(char *, unsigned *, unsigned *, void *), void *);
