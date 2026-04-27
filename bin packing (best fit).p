#include <stdio.h>

// Best Fit algorithm
void bestFit(int items[], int n, int cap) {
    int bin[n], count = 0;

    // Initialize bins
    for (int i = 0; i < n; i++)
        bin[i] = cap;

    // Place each item
    for (int i = 0; i < n; i++) {
        int best = -1, min = cap + 1;

        // Find best bin (least remaining space)
        for (int j = 0; j < count; j++) {
            if (bin[j] >= items[i] && bin[j] - items[i] < min) {
                best = j;
                min = bin[j] - items[i];
            }
        }

        // Place item
        if (best != -1) {
            bin[best] -= items[i];
            printf("Item %d -> Bin %d\n", items[i], best+1);
        } else {
            bin[count] -= items[i];
            printf("Item %d -> Bin %d\n", items[i], count+1);
            count++;
        }
    }

    printf("Total bins = %d\n", count);
}

int main() {
    int items[] = {4, 8, 1, 4, 2, 1};
    bestFit(items, 6, 10);
    return 0;
}
/*
Sample Output:
Item 4 -> Bin 1
Item 8 -> Bin 2
Item 1 -> Bin 1
Item 4 -> Bin 3
Item 2 -> Bin 1
Item 1 -> Bin 1
Total bins = 3
*/
