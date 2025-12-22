#pragma once

/**
 * Structure for storing a graph.
 */
typedef struct _IntGraph IntGraph;

/**
 * Creates a new graph, with no elements.
 * @return A reference to a graph.
 */
IntGraph *intGraph_new();

/**
 * Frees all the memory allocated for the graph.
 * @param graph Reference to the graph to be freed.
 */
void intGraph_free(IntGraph *graph);

/**
 * Adds the vertex in the graph. If the vertex is already inside, nothing happens.
 * @param graph Reference to the graph.
 * @param vertex The vertex.
 */
void intGraph_addVertex(IntGraph *graph, int vertex);

/**
 * Adds the edge in the graph. If the edge is already inside, nothing happens.
 * @param graph Reference to the graph.
 * @param srcVertex The first vertex of the edge.
 * @param dstVertex The second vertex of the edge.
 */
void intGraph_addEdge(IntGraph *graph, int srcVertex, int dstVertex);

/**
 * Builds the internal representation of the graph.
 * @param graph Reference to the graph.
 */
void intGraph_build(IntGraph *graph);

/**
 * Iterates through elements of the graph in BFS order and calls the given function with the element's reference as a parameter and the context.
 * @param graph Reference to the graph.
 * @param srcVertex The starting vertex.
 * @param context Reference to a context to be passed to the function.
 * @param func Reference to a function to be called on each element.
 * The function should have the following signature:
 *   void func(int *value, void *context);
 */
void intGraph_bfs(IntGraph *graph, int srcVertex, void *context, void (*func)(int *, void *));

/**
 * Iterates through elements of the graph in DFS order and calls the given function with the element's reference as a parameter and the context.
 * @param graph Reference to the graph.
 * @param srcVertex The starting vertex.
 * @param context Reference to a context to be passed to the function.
 * @param func Reference to a function to be called on each element.
 * The function should have the following signature:
 *   void func(int *value, void *context);
 */
void intGraph_dfs(IntGraph *graph, int srcVertex, void *context, void (*func)(int *, void *));

/**
 * Prints the internal representation of the graph.
 * @param graph Reference to the graph.
 */
void intGraph_print(IntGraph *graph);
