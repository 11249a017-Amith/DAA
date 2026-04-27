#include <stdio.h>

#define V 5
#define E 6

int parent[V];

// Find root of the set
int find(int v) {
    while (parent[v] != v)
        v = parent[v];
    return v;
}

// Union of two sets
void unionSet(int u, int v) {
    int a = find(u);
    int b = find(v);
    parent[a] = b;
}

// Sort edges based on weight (ascending)
void sortEdges(int edges[E][3]) {
    for (int i = 0; i < E - 1; i++) {
        for (int j = 0; j < E - i - 1; j++) {
            if (edges[j][2] > edges[j + 1][2]) {
                for (int k = 0; k < 3; k++) {
                    int temp = edges[j][k];
                    edges[j][k] = edges[j + 1][k];
                    edges[j + 1][k] = temp;
                }
            }
        }
    }
}

// Kruskal's MST function
void kruskal(int edges[E][3]) {
    sortEdges(edges);

    // Initialize parent array
    for (int i = 0; i < V; i++)
        parent[i] = i;

    int cost = 0, count = 0;

    printf("Selected Edges:\n");

    // Pick smallest edges and avoid cycles
    for (int i = 0; i < E; i++) {
        int u = edges[i][0];
        int v = edges[i][1];
        int w = edges[i][2];

        if (find(u) != find(v)) {
            printf("%d -- %d (Weight: %d)\n", u, v, w);
            unionSet(u, v);
            cost += w;
            count++;
        }

        if (count == V - 1)
            break;
    }

    printf("Total Cost: %d\n", cost);
}

int main() {
    int edges[E][3] = {
        {0, 1, 2},
        {0, 2, 3},
        {1, 2, 5},
        {1, 3, 3},
        {2, 4, 4},
        {3, 4, 2}
    };

    kruskal(edges);
    return 0;
}
/*
Sample Output:
Selected Edges:
0 -- 1 (Weight: 2)
3 -- 4 (Weight: 2)
0 -- 2 (Weight: 3)
1 -- 3 (Weight: 3)
Total Cost: 10
*/
