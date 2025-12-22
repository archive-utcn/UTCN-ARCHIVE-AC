#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <intGraph.h>
#include <Vector.h>
#include <array_int.h>
#include <intQueue.h>
#include <intStack.h>

#define graphEmptyPrecaution(graph) \
    if (graph == NULL)              \
        return;

typedef struct
{
    int x;
    int y;
} Edge;

struct _IntGraph
{
    Array *verts;
    Vector *edges;
};

IntGraph *intGraph_new()
{
    IntGraph *graph = (IntGraph *)malloc(sizeof(IntGraph));
    graph->verts = array_new(1);             // sizeof(int));
    graph->edges = vector_new(sizeof(Edge)); // sizeof(Edge));
    return graph;
}

void intGraph_free(IntGraph *graph)
{
    if (graph == NULL)
        return;

    array_free(graph->verts);

    vector_free(graph->edges);

    free(graph);
    graph = NULL;
}

void intGraph_addVertex(IntGraph *graph, int vertex)
{
    graphEmptyPrecaution(graph);

    array_push_back(graph->verts, vertex);
}

void intGraph_addEdge(IntGraph *graph, int srcVertex, int dstVertex)
{
    graphEmptyPrecaution(graph);

    Edge edge = {.x = srcVertex, .y = dstVertex};
    vector_push_back(graph->edges, &edge);

    printf("%d %d\n", ((Edge *)vector_at(graph->edges, 0))->x, ((Edge *)vector_at(graph->edges, 0))->y);
    // printf("size: %d\n", vector_size(graph->edges));
}

void intGraph_build(IntGraph *graph)
{
    graphEmptyPrecaution(graph);

    // builds internal representation of the graph
    // ce se presupune ca ar trebui sa fac???
}

void intGraph_bfs(IntGraph *graph, int srcVertex, void *context, void (*func)(int *, void *))
{
    graphEmptyPrecaution(graph);

    IntQueue *queue = intQueue_new();
    Array *visited = array_new(1);

    intQueue_enqueue(queue, srcVertex);
    while (intQueue_size(queue) != 0)
    {
        int vertex = *intQueue_peek(queue);
        intQueue_dequeue(queue);

        array_push_back(visited, vertex);
        func(&vertex, context);
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

void intGraph_dfs(IntGraph *graph, int srcVertex, void *context, void (*func)(int *, void *)){
    graphEmptyPrecaution(graph);

    IntStack *stack = intStack_new();
    Array *visited = array_new(1);

    intStack_push(stack, srcVertex);
    while (intStack_size(stack) != 0)
    {
        int vertex = *intStack_peek(stack);
        intStack_pop(stack);

        array_push_back(visited, vertex);
        func(&vertex, context);
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

void intGraph_print(IntGraph *graph)
{
    graphEmptyPrecaution(graph);

    printf("Vertices:\n");
    for (int i = 0; i < array_get_size(graph->verts); i++)
        printf("%d ", array_get(graph->verts, i));
    printf("\n");

    printf("Edges: %d\n", vector_size(graph->edges));
    for (int i = 0; i < vector_size(graph->edges); i++)
    {
        Edge *edge = (Edge *)vector_at(graph->edges, i);
        printf("(%d, %d) ", edge->x, edge->y);
    }
    printf("\n");
}
