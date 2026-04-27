#include <stdio.h>
#define MAXN 15
#define INF 999999

int n, d[MAXN][MAXN];
int dp[MAXN][1 << MAXN];

// Recursive DP (bitmask) to find minimum cost
int tsp(int i, int mask) {

    // If no city left, return cost to starting city
    if (mask == 0)
        return d[i][0];

    // Return already computed result
    if (dp[i][mask] != -1)
        return dp[i][mask];

    int minCost = INF;

    // Try all cities in mask
    for (int k = 0; k < n; k++) {
        if (mask & (1 << k)) {
            int cost = d[i][k] + tsp(k, mask & ~(1 << k));
            if (cost < minCost)
                minCost = cost;
        }
    }

    return dp[i][mask] = minCost;
}

int main() {
    printf("Enter number of cities: ");
    scanf("%d", &n);

    printf("Enter cost matrix:\n");
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            scanf("%d", &d[i][j]);

    // Initialize DP table
    for (int i = 0; i < MAXN; i++)
        for (int j = 0; j < (1 << MAXN); j++)
            dp[i][j] = -1;

    // Create mask for cities except starting city (0)
    int mask = 0;
    for (int i = 1; i < n; i++)
        mask |= (1 << i);

    int result = tsp(0, mask);

    printf("\nMinimum travelling cost: %d\n", result);
    return 0;
}

/*
Sample Output:
Minimum travelling cost: 80
*/
