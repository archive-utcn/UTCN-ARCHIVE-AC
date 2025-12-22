#include <stdio.h>
#include <stdlib.h>
#include <intGraph.h>

void printVert(int *elm, void *context)
{
    printf("%d ", *elm);
}

void test()
{
    printf("function %s\n", __FUNCTION__);

    IntGraph *graph = intGraph_new();
    intGraph_addVertex(graph, 1);
    intGraph_addVertex(graph, 2);
    intGraph_addVertex(graph, 3);
    intGraph_addVertex(graph, 4);

    intGraph_addEdge(graph, 1, 2);
    intGraph_addEdge(graph, 1, 3);
    intGraph_addEdge(graph, 1, 4);

    intGraph_bfs(graph, 1, NULL, printVert);
    printf("\n\n");
    intGraph_dfs(graph, 1, NULL, printVert);
    printf("\n\n");

    intGraph_print(graph);
    intGraph_free(graph);

    printf("\nSucces!\n");
}

int main(int argc, char const *argv[])
{
    // printf("ajhdvuagwdvhuawvdhv");
    test();

    return 0;
}
