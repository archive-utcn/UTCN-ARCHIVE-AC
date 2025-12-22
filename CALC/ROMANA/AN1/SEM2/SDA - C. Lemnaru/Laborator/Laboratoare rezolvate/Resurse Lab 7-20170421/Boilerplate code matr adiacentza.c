#include <stdio.h>
#include <stdlib.h>

/*****************************************************
  Citirea datelor despre un graf dintr-un fisier
  cu reprezentarea grafului prin matrice de adiacenta.
  In fisier se da numarul n de varfuri ale grafului,
  apoi muchiile sub forma de perechi i j, cu 0<=i,j<n
  (i si j reprezinta indicii varfurilor conectate prin
   arc (sau muchie)).
  Graful se parcurge BFS si se scriu într-un fisier
  nodurile în ordinea parcurgerii.
******************************************************/

typedef struct {
    int n;      // numar de varfuri
    int **m;    // matricea de adiacenta
} Graf;     // structura pentru memorarea grafului prin matrice de adiacenta

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

    // Alocam dinamic matricea de adiacenta:
    pG->m = calloc(pG->n, sizeof(int*));
    if (pG->m == NULL) printErr();  // alocare esuata
    int i;
    for (i=0; i<pG->n; i++) {
        // alocam dinamic linia i a matricii, cu n elemente intregi
        pG->m[i] = calloc(pG->n, sizeof(int));
        if (pG->m[i] == NULL) printErr();
    }

    int v, w;
    // citeste pe rand perechi (v, w) si memoreaza arcul/muchia in matricea de adiacenta:
    while (fscanf(f, "%d%d", &v, &w) == 2) {
        /// TODO: memoreaza arcul/muchia in matricea de adiacenta
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
