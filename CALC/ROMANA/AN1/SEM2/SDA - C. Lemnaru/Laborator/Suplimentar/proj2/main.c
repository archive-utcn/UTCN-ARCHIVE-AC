#include <stdlib.h>
#include <stdio.h>
#include "intLinkedList.h"

void da(int *val, void* _){
    printf("%d ", *val);
}

void test1()
{
    printf("%s:\n", __FUNCTION__);
    IntLinkedList *a = intLinkedList_new();
    intLinkedList_push_back(a, 10);
    intLinkedList_push_back(a, 20);
    intLinkedList_push_back(a, 30);
    intLinkedList_push_back(a, 40);
    intLinkedList_push_back(a, 50);
    intLinkedList_forEach(a, NULL, da); printf("\n");
    intLinkedList_free(a);
    printf("Success!\n\n");
}

void test2(){
    printf("%s:\n", __FUNCTION__);
    IntLinkedList *a = intLinkedList_new();
    intLinkedList_push_back(a, 10);
    intLinkedList_push_front(a, 20);
    intLinkedList_push_at(a, 1,30);
    intLinkedList_push_at(a, 2,40);
    intLinkedList_push_at(a, 3,50);
    intLinkedList_forEach(a, NULL, da); printf("\n");
    intLinkedList_pop_front(a);
    intLinkedList_pop_back(a);
    intLinkedList_forEach(a, NULL, da); printf("\n");
    intLinkedList_remove(a, 50);
    intLinkedList_forEach(a, NULL, da); printf("\n");
    intLinkedList_free(a);
    printf("Success!\n\n");
}

void test3(){
    printf("%s:\n", __FUNCTION__);
    IntLinkedList *a = intLinkedList_new();
    intLinkedList_push_back(a, 10);
    intLinkedList_push_front(a, 20);
    printf(intLinkedList_contains(a, 10) ? "Avem 10!\n" : "Nu avem 10!\n");
    intLinkedList_clear(a);
    printf("Lista dupa stergere: ");
    intLinkedList_forEach(a, NULL, da); printf("\n");
    intLinkedList_push_back(a, 10);
    intLinkedList_push_back(a, 20);
    intLinkedList_push_back(a, 30);
    intLinkedList_pop_back(a);
    printf("Dupa adaugare numere si stergere ultimul: ");
    intLinkedList_forEach(a, NULL, da); printf("\n");
    intLinkedList_free(a);
    printf("Success!\n\n");
}

int main()
{
    test1();
    test2();
    test3();
    return 0;
}