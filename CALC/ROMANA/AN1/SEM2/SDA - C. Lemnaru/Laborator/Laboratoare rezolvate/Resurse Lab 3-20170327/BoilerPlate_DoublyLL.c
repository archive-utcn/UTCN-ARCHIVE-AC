#include <stdlib.h>
#include <stdio.h>

typedef struct node {
    int key;
    struct node *next;
    struct node *prev;
} NodeDL;


/* define a List structure, consisting of the addresses
 * (pointers) of the first and last elements
 * */
struct list_header {
    NodeDL *first;
    NodeDL *last;
};


void print_forward(struct list_header L){
    //TODO insert code here
}

void print_backward(struct list_header L){
    //TODO insert code here

}

NodeDL *search(struct list_header L, int givenKey){
    //TODO insert code here
    return NULL;
}


void insert_first(struct list_header *L, int givenKey){
    //TODO insert code here
}


void insert_last(struct list_header *L, int givenKey){
    //TODO insert code here
}

void insert_after_key(struct list_header *L, int afterKey, int givenKey){
    //TODO insert code here
}

void delete_first(struct list_header *L){
    //TODO insert code here
}

void delete_last(struct list_header *L) {
    //TODO insert code here
}

void delete_key(struct list_header *L, int givenKey){
    //TODO insert code here
}


int main(){
    /* initialize list to empty list */
    struct list_header L = {NULL, NULL};

    /* test insertion operations */
    /* insert some elements at the beginning */
    insert_first(&L, 3);
    insert_first(&L, 4);
    insert_first(&L, 2);
    insert_first(&L, 1);

    /* ... and some at the end */
    insert_last(&L, 6);
    insert_last(&L, 8);

    /* print list contents */
    print_forward(L); // 1 2 4 3 6 8
    print_backward(L); // 8 6 3 4 2 1

    /* test search operation */
    //search for two distinct keys...
    int toSearch = 2;
    NodeDL *foundNode = search(L, toSearch);
    if (foundNode == NULL) {
        printf("Node %d NOT found!\n", toSearch);
    } else {
        printf("Node %d found!\n", foundNode->key);
    }

    toSearch = 9;
    foundNode = search(L, toSearch);
    if (foundNode == NULL) {
        printf("Node %d NOT found!\n", toSearch);
    } else {
        printf("Node %d found!\n", foundNode->key);
    }


    /* test deletions */
    delete_first(&L);
    delete_last(&L);
    delete_key(&L, 4);
    delete_key(&L, 15);

    /* print list contents */
    print_forward(L); // 2 3 6
    print_backward(L); // 6 3 2

    delete_key(&L, 2);
    delete_key(&L, 6);

    /* print list contents */
    print_forward(L); // 3
    print_backward(L); // 3

    return 0;
}