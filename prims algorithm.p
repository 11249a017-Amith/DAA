#include <stdio.h>
#define V 5

// Find vertex with minimum key value
int minKey(int key[], int visited[]) {
    int min = 999999, min_index;

    for (int i = 0; i < V; i++) {
        if (!visited[i] && key[i] < min) {
            min = key[i];
            min_index = i;
        }
    }
    return min_index;
}

// Prim's MST function
void primMST(int graph[V][V]) {
    int parent[V], key[V], visited[V];

    // Initialize arrays
    for (int i = 0; i < V; i++) {
        key[i] = 999999;
        visited[i] = 0;
    }

    key[0] = 0;      // Start from vertex 0
    parent[0] = -1;  // Root node

    // Construct MST
    for (int count = 0; count < V - 1; count++) {
        int u = minKey(key, visited);
        visited[u] = 1;

        for (int v = 0; v < V; v++) {
            if (graph[u][v] && !visited[v] && graph[u][v] < key[v]) {
                parent[v] = u;
                key[v] = graph[u][v];
            }
        }
    }

    int total = 0;
    printf("\nPrim's MST:\n");
    printf("Edge \tWeight\n");

    // Print MST
    for (int i = 1; i < V; i++) {
        printf("%d - %d \t%d\n", parent[i], i, graph[i][parent[i]]);
        total += graph[i][parent[i]];
    }

    printf("Total Cost = %d\n", total);
}

int main() {
    int graph[V][V] = {
        {0, 2, 3, 0, 0},
        {2, 0, 5, 3, 0},
        {3, 5, 0, 0, 4},
        {0, 3, 0, 0, 2},
        {0, 0, 4, 2, 0}
    };

    primMST(graph);
    return 0;
}

/*
Sample Output:
Prim's MST:
Edge    Weight
0 - 1   2
0 - 2   3
1 - 3   3
3 - 4   2
Total Cost = 10
*/
