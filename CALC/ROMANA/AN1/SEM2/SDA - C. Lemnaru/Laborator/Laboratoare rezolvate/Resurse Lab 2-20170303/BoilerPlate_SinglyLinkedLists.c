#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int key;
    struct node *next;
} NodeT;

NodeT *search(NodeT *head, int givenKey) {
    //TODO: search the given key and return the first node containing it or NULL
    return NULL;
}

void print_list(NodeT *head){
    //TODO: print list keys
}

void insert_first(NodeT **head, NodeT **tail, int givenKey) {
    //TODO: insert the given key in the first position of the list given by head and tail;
}

void insert_last(NodeT **head, NodeT **tail, int givenKey) {
    //TODO: insert the given key in the last position of the list given by head and tail;
}

void insert_after_key(NodeT** head, NodeT** tail, int afterKey, int givenKey){
    //TODO: insert the given key after afterKey, in list given by head and tail;
}

void delete_first(NodeT** head, NodeT** tail){
    //TODO: delete first list element
}

void delete_last(NodeT** head, NodeT** tail){
    //TODO: delete last list element
}

void delete_key(NodeT** first, NodeT** last, int givenKey){
    //TODO: delete element having given key
}

int main() {
    NodeT *first = NULL;
    NodeT *last  = NULL;

    //perform several insertions
    insert_first(&first, &last, 4);
    insert_first(&first, &last, 1);
    insert_last(&first, &last, 3);

    //search for two distinct keys...
    int toSearch = 2;
    NodeT *foundNode = search(first, toSearch);
    if (foundNode == NULL) {
        printf("Node %d not found!\n", toSearch);
    } else {
        printf("%d found!", foundNode->key);
    }

    toSearch = 3;
    foundNode = search(first, toSearch);
    if (foundNode == NULL) {
        printf("Node %d not found!\n", toSearch);
    } else {
        printf("%d found!", foundNode->key);
    }

    //perform some insertions
    insert_after_key(&first, &last, 4, 22);
    insert_after_key(&first, &last, 3, 25);

    //print list contents
    print_list(first);

    //perform some deletions
    delete_first(&first,&last);
    delete_last(&first, &last);
    delete_key(&first, &last, 22);
    delete_key(&first, &last, 8);

    //print list contents
    print_list(first);


    //TODO: place here code to delete all list
    /*....*/

    //print list contents
    print_list(first);

    return 0;
}