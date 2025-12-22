
#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int key;
    struct node *left;
    struct node *right;
} NodeT;


void preOrder( NodeT *p) {

}
void inOrder( NodeT *p) {
}

void postOrder( NodeT *p) {

}

/* recursive version of insert */
NodeT *insertNode( NodeT *root, int key ) {

    return root;
}

/* non-recursive function of find Node */

NodeT *searchKey( NodeT *root, int key ) {
    return NULL; /* not found */
}


/* non-recursive function of finding the node with the minimum value */

NodeT* findMin(NodeT* node)
{
    NodeT* p = node;

    /* TODO - adaugati cod aici */

    return p;
}


/* non-recursive function of finding the node with the maximum value */

NodeT* findMax(NodeT* node)
{
    NodeT* p = node;

    /* TODO - adaugati cod aici */

    return p;
}

/* succesorul unui nod este minimul din subarborele drept*/
NodeT* succesor(NodeT *node){
    NodeT* p = node;

    /* TODO - adaugati cod aici */

    return p;
}

NodeT* predecesor(NodeT *node){
/* TODO - adaugati cod aici */
}

/* recursive function of delete Node */

NodeT* deleteNode(NodeT* root, int key) {
/* TODO - adaugati cod aici */
    return root;
}


int main() {

    NodeT* root;
    NodeT *p;
    int i, n, key;


    printf( "Numarul de noduri din arbore = " );
    scanf( "%d", &n );
    root = NULL;

    for ( i = 0; i < n; i++ ){
        printf( "\nKey = " );
        scanf( "%d", &key );
        root = insertNode( root, key );
    }

    printf( "\nPreorder listing\n" );
    preOrder( root);
    printf( "\nInorder listing\n" );
    inOrder( root );
    printf( "\nPostorder listing\n" );
    postOrder( root);

    printf( "Dati cheia pe care o cautati = " );
    scanf( "%d", &key );
    p = searchKey( root, key );
    if ( p != NULL ){
        printf( "Nod cu cheia = %d gasit\n" , key);
        NodeT *m = findMin(p);
        printf("Minimul din subarborele care are ca radacina nodul %d este %d \n", p->key, m->key);
    }
    else
      printf( "Nodul NU a fost gasit \n" );

    NodeT *s = succesor(p);
    if ( s != NULL ){
        printf( "Nod cu cheia = %d are sucesor pe %d\n" , p->key, s->key);
    }
    else
      printf( "Nodul NU are succesor !\n" );

    NodeT *q = predecesor(p);
    if ( q != NULL ){
        printf( "Nod cu cheia = %d are predecesor pe %d\n" , p->key, q->key);
    }
    else
      printf( "Nodul NU are predecesor !\n" );


    printf( "Cheia nodului de sters = " );
    scanf( "%d", &key );
    root = deleteNode( root, key );
    inOrder( root);

    return 0;

}
