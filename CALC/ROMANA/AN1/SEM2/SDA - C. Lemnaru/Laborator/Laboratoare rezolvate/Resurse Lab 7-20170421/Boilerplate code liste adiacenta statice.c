#include <stdio.h>
#include <stdlib.h>

/*****************************************************
  Citirea datelor despre un graf dintr-un fisier
  cu reprezentarea grafului prin liste de adiacenta statice.
  In fisier se da numarul n de varfuri ale grafului,
  apoi muchiile sub forma de perechi i j, cu 0<=i,j<n
  (i si j reprezinta indicii varfurilor conectate prin
   arc (sau muchie)).
  Graful se parcurge BFS si se scriu într-un fisier
  nodurile în ordinea parcurgerii.
******************************************************/

typedef struct {
    int n;      // numar de varfuri
    int *t;     // tabloul de indici ai "inceputurilor" de liste (va fi alocat dinamic)
    int *liste; // tabloul ce va contine listele de adiacenta (va fi alocat dinamic)
} Graf;     // structura pentru memorarea grafului prin liste de adiacenta dinamice

enum { NEVIZITAT, VIZITAT };

/// TODO: de definit o structura Coada si
/// operatiile initializeaza, enqueue, dequeue, goala

void printErr() {
    printf("Memorie insuficienta!\n");
    exit(1);
}

void bfs( Graf G, int nodSursa )
{
	int* vizitate; /* pentru marcarea nodurilor vizitate */
	vizitate = calloc(G.n, sizeof(int));
	if (vizitate == NULL) printErr();

///	Coada Q; /* coada nodurilor - intregi */

	int i, v, w; /* noduri */

///	initializeaza( Q );
	for ( i = 0; i < G.n; i++ ) /* marcam toate nodurile ca nevizitate */
		vizitate[ i ] = NEVIZITAT;
	vizitate[ nodSursa ] = VIZITAT; /* marcam nodul sursa ca vizitat */
/*	procesam informatia pt nodSursa;
	enqueue( nodSursa, Q );
	// nodSursa va fi primul nod scos din coada
	while( ! goala( Q ))
	{
		v = dequeue( Q );
		for ( fiecare nod w adiacent cu v )
			if ( vizitate[ w ] == NEVIZITAT )
			{
				vizitate[ w ] = VIZITAT;
				procesam informatia pt w;
				enqueue( w, Q );
			}
	}   */
}

void citesteGraf(FILE* f, Graf* pG) {
    fscanf(f, "%d", &pG->n);    // citeste nr. de varfuri

    // Alocam dinamic tabloul t, de dimensiune n:
    pG->t = calloc(pG->n, sizeof(int));
    if (pG->t == NULL) printErr();  // alocare esuata

    int i;
    for (i=0; i<pG->n; i++) {
        // initializam (liste vide)
        pG->t[i] = -1;  // t[i] ar contine indicele (in tabloul liste) de la care incepe lista de noduri adiacente cu i
    }

    // dimensiunea maxima a tabloului liste este n^2 (maxim n-1 varfuri adiacente cu
    // fiecare varf, plus sfarsitul fiecarei liste de adiacenta)
    pG->liste = calloc(pG->n * pG->n, sizeof(int));
    if (pG->liste == NULL) printErr();  // alocare esuata

    int v, w;
    // citeste pe rand perechi (v, w) si memoreaza arcul/muchia in listele de adiacenta statice:
    while (fscanf(f, "%d%d", &v, &w) == 2) {
        /// TODO: memoreaza arcul/muchia in listele de adiacenta statice
    }
}

int main()
{
    FILE* f = fopen("graf.txt", "r");
    if (f == NULL) {
        perror("graf.txt");
        exit(1);
    }
    Graf G;
    citesteGraf(f, &G);
    fclose(f);

    int v;
    printf("Numarul de noduri: %d. \nDati nodul sursa: ", G.n);
    scanf("%d", &v);

    bfs(G, v);

    return 0;
}
