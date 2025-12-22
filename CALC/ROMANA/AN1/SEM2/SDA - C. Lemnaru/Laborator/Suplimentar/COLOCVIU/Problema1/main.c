#include <stdio.h>
#include <stdlib.h>
#include <intGraph.h>

void prV(void *a)
{
    printf("%s\n", (char *)a);
}

void prE(void *a, void* b)
{
    printf("%s %s\n", (char *)a, (char *)b);
}

void pr(char*a, void*b){
    printf("%s\n", a);
}

int main()
{
    FILE *intrare = (FILE *)fopen("./../subiect/ex1.txt", "r");
    if (!intrare)
    {
        printf("Problema cu fisierul!");
        return 0;
    }

    IntGraph *orase = intGraph_new();

    char nume1[51], nume2[51];
    while(!feof(intrare)){
        fscanf(intrare, "%s %s ", nume1, nume2);
        intGraph_addVertex(orase, nume1);
        intGraph_addVertex(orase, nume2);
        intGraph_addEdge(orase, nume1, nume2);
    }
    fclose(intrare);

    intGraph_printV(orase, prV);

    char orasDFS[51];
    printf("\nDati orasul de start(DFS):");
    scanf("%s", orasDFS);   
    intGraph_dfs(orase, orasDFS, NULL, pr);

    intGraph_free(orase);
    return 0;
}
