#include <stdio.h>
#include <stdlib.h>
#include "rocketBinarySearchTree.h"
#include <string.h>

void printRacheta(char *nume, unsigned *an, unsigned *putere)
{
    printf("%s, din %d, si puterea %d\n", nume, *an, *putere);
}

void medie_propulsie(char *nume, unsigned *an, unsigned *putere, void *context)
{
    *((float *)(context)) += *putere;
}

void test1()
{
    printf("%s:\n", __FUNCTION__);

    RocketBinarySearchTree *tree = rocketBinarySearchTree_new();
    rocketBinarySearchTree_add(tree, "Racheta1", 15, 10);
    rocketBinarySearchTree_add(tree, "Racheta3", 5, 10);
    rocketBinarySearchTree_add(tree, "Racheta2", 0, 10);
    rocketBinarySearchTree_add(tree, "Racheta4", 100, 10);
    rocketBinarySearchTree_add(tree, "apollo", 1967, 15);
    rocketBinarySearchTree_print(tree);

    char nume_racheta[] = "Racheta4";
    printf("Racheta \"%s\" este in sistem: %s",
           nume_racheta,
           rocketBinarySearchTree_contains(tree, nume_racheta)
               ? "DA\n\n"
               : "NU\n\n");

    char substr[] = "cheta";
    printf("Rachetele ce contin \"%s\" sunt:\n", substr);
    rocketBinarySearchTree_contains_substring(tree,
                                              substr,
                                              printRacheta);

    printf("\nToate rachetele din sistem sunt: ");
    unsigned rach_no = rocketBinarySearchTree_count(tree);
    Rocket *lista_rachete = rocketBinarySearchTree_toList(tree);
    for (int i = 0; i < rach_no; i++)
        printf("%s ", lista_rachete[i].nume);

    float suma_prop = 0;
    rocketBinarySearchTree_forEach(tree, medie_propulsie, &suma_prop);
    printf("\n\nMedia propulsiilor este: %f\n", suma_prop / rach_no);

    rocketBinarySearchTree_free(tree);

    printf("\nSucces!\n");
}

int main()
{
    test1();
    return 0;
}