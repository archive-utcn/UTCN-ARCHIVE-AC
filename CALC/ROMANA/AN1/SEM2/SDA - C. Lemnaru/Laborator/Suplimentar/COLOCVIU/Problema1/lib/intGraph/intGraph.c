#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <intGraph.h>
#include <Vector.h>
#include <array_int.h>
#include <intQueue.h>
#include <intStack.h>
#include <string.h>

#define graphEmptyPrecaution(graph) \
    if (graph == NULL)              \
        return;

typedef struct
{
    int x;
    int y;
} Edge;

typedef struct
{
    char oras[52];
} Vertex;

struct _IntGraph
{
    Vector *verts;
    Vector *edges;
};

IntGraph *intGraph_new()
{
    IntGraph *graph = (IntGraph *)malloc(sizeof(IntGraph));
    graph->verts = vector_new(sizeof(Vertex));
    graph->edges = vector_new(sizeof(Edge));
    return graph;
}

void intGraph_free(IntGraph *graph)
{
    if (graph == NULL)
        return;

    vector_free(graph->verts);
    vector_free(graph->edges);

    free(graph);
    graph = NULL;
}

int matchSeq(void *a, void *b){
    return strcmp(a,b) == 0;
}

void intGraph_addVertex(IntGraph *graph, char* vertex)
{
    graphEmptyPrecaution(graph);

    if(elmIndex(graph->verts, vertex, matchSeq) != -1)
        return;
    vector_push_back(graph->verts, vertex);
}

void intGraph_addEdge(IntGraph *graph, char* srcVertex, char* dstVertex)
{
    graphEmptyPrecaution(graph);
    int index1 = elmIndex(graph->verts, srcVertex, matchSeq);
    int index2 = elmIndex(graph->verts, dstVertex, matchSeq);
    if(index1 == -1 || index2 == -1)
        return;

    Edge *edge = malloc(sizeof(Edge));
    edge->x = index1; 
    edge->y = index2; 
    vector_push_back(graph->edges, edge);
}

void intGraph_bfs(IntGraph *graph, char* srcVertex, void *context, void (*func)(char *, void *))
{
    graphEmptyPrecaution(graph);

    IntQueue *queue = intQueue_new();
    Array *visited = array_new(1);

    intQueue_enqueue(queue, vector_contains(graph->verts, srcVertex, matchSeq));
    while (intQueue_size(queue) != 0)
    {
        int vertex = *intQueue_peek(queue);
        intQueue_dequeue(queue);

        array_push_back(visited, vertex);
        func(vector_at(graph->verts, vertex), context);
        for (int i = 0; i < vector_size(graph->edges); i++)
        {
            Edge *edge = (Edge *)vector_at(graph->edges, i);
            if (edge->x == vertex)
            {
                if (array_contains(visited, edge->y) == 0)
                    intQueue_enqueue(queue, edge->y);
            }
        }
    }

    intQueue_free(queue);
    array_free(visited);
}

void intGraph_dfs(IntGraph *graph, char* srcVertex, void *context, void (*func)(char *, void *))
{
    graphEmptyPrecaution(graph);

    IntStack *stack = intStack_new();
    Array *visited = array_new(1);

    intStack_push(stack, vector_contains(graph->verts, srcVertex, matchSeq));
    while (intStack_size(stack) != 0)
    {
        int vertex = *intStack_peek(stack);
        intStack_pop(stack);

        array_push_back(visited, vertex);
        func(vector_at(graph->verts, vertex), context);
        for (int i = 0; i < vector_size(graph->edges); i++)
        {
            Edge *edge = (Edge *)vector_at(graph->edges, i);
            if (edge->x == vertex)
            {
                if (array_contains(visited, edge->y) == 0)
                    intStack_push(stack, edge->y);
            }
        }
    }

    intStack_free(stack);
    array_free(visited);
}

void intGraph_printV(IntGraph *graph, void (*printVert)(void*))
{
    graphEmptyPrecaution(graph);

    // printf("Vertices:\n");
    for (int i = 0; i < vector_size(graph->verts); i++)
        printVert(vector_at(graph->verts, i));
    // printf("\n");
}

void intGraph_printE(IntGraph *graph, void (*printEdge)(void*, void*))
{
    graphEmptyPrecaution(graph);

    // printf("Edges:\n");
    Edge *edge;
    for (int i = 0; i < vector_size(graph->edges); i++)
    {
        edge = (Edge *)vector_at(graph->edges, i);
        printEdge(vector_at(graph->verts, edge->x), vector_at(graph->verts, edge->y));
    }
    // printf("\n");
}

void intGraph_print(IntGraph *graph, void (*printVert)(void*), void (*printEdge)(void*, void*))
{
    graphEmptyPrecaution(graph);

    intGraph_printV(graph, printVert);
    printf("\n");
    intGraph_printE(graph, printEdge);
}
