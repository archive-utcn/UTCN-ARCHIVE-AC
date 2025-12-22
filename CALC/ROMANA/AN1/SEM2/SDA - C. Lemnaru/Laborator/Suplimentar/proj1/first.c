#include <stdio.h>
#include <stdlib.h>
#include "array_int.h"

void test1(){
    printf("%s start\n", __FUNCTION__);
    Array *a = array_new(10);
    array_push_back(a,1);
    array_push_back(a,2);
    array_push_back(a,3);
    array_push_back(a,4);
    array_push_back(a,5);
    array_push_back(a,6);
    printf("Elementul de pe pozitia 3 (indexare de la 0) este: %d\n", array_get(a,3));
    array_print(a);
    array_free(a);
    printf("%s success!\n\n", __FUNCTION__);
}

void test2(){
    printf("%s start\n", __FUNCTION__);
    Array *a = array_new(1);
    array_print(a);
    array_free(a);
    printf("%s success!\n\n", __FUNCTION__);
}

void test3(){
    printf("%s start\n", __FUNCTION__);
    Array *a = NULL;
    array_print(a);
    array_free(a);
    printf("%s success!\n\n", __FUNCTION__);
}

void test4(){
    printf("%s start\n", __FUNCTION__);
    Array *a = array_new(10);
    array_push_back(a,1);
    // a->size = 10;
    array_print(a);
    array_free(a);
    printf("%s success!\n\n", __FUNCTION__);
}

void print(int a){
    printf("%d ", a);
}

void test5(){
    printf("%s start\n", __FUNCTION__);
    Array *a = array_new(10);
    array_push_back(a, 5);
    array_push_back(a, 10);
    array_push_back(a, 15);
    array_foreach(a, print);
    printf("\n%s success!\n\n", __FUNCTION__);
}

int main(){
    struct Array* var;
    
    test1();
    test2();
    test3();
    test4();
    test5();
    return 0;
}