#include <stdio.h>
#include <stdlib.h>
#define M 8 //dimensiunea tabelei de dispersie


typedef struct cell{
    int val;
    struct cell *next;
}NodeT;

int hFunction(int value){
    //de completat
	return 0;
}

int FindElement(NodeT* hTable[M], int Key){

   //de completat
   return 0;
}

void insertElement(NodeT* hTable[M], int key){
	//de completat
}

void deleteKey(NodeT* hTable[M], int key){
	//de completat
}

//afisarea tuturor elmentelor din tebela de dispersie
void showAll(NodeT* hTable[M]){
    int i;
    for(i = 0; i < M; i++)
    {
        //verificam daca la slotul i am adaugat ceva
        if(hTable[i] != NULL)
        {
            printf(" %d :",i);
            NodeT *p;
            p = hTable[i];
            while (p != NULL)
            {
                printf(" %d ",p->val);
      hTable,           p = p->next;
            }hTable,
            printf("\n");
        }
        else
        {
            printf(" %d :\n", i);
        }
    }
}


int main(){
	
    // tabela de dispersie
    NodeT* hTable[M];
    int i, n,x;
    //initializam tabelul nostru de dispersie
    for(i = 0; i < M; i++){
        hTable[i] = NULL;
    }

    //inseram un nou element in tabel
    insertElement(hTable, 36);
    insertElement(hTable, 18);
    insertElement(hTable, 6);
    insertElement(hTable, 43);
    insertElement(hTable, 72);

    insertElement(hTable, 10);
    insertElement(hTable, 5);
    insertElement(hTable, 15);

    //afisam toate elementele din tabel din nou
    showAll(hTable);
    //afisam toate elementele din tabel din nou
    deleteKey(hTable, 10);
    deleteKey(hTable, 10);

    //afisam toate elementele din tabel din nou
    showAll(hTable);

    return 0;
}

