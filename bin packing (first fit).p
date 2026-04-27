#include <stdio.h>

// First Fit algorithm
void firstFit(int items[], int n, int cap) {
    int bin[n], count = 0;

    // Initialize bins with full capacity
    for (int i = 0; i < n; i++)
        bin[i] = cap;

    // Place each item
    for (int i = 0; i < n; i++) {
        int placed = 0;

        // Check existing bins
        for (int j = 0; j < count; j++) {
            if (bin[j] >= items[i]) {
                bin[j] -= items[i];
                printf("Item %d -> Bin %d\n", items[i], j+1);
                placed = 1;
                break;
            }
        }

        // If not placed, create new bin
        if (!placed) {
            bin[count] -= items[i];
            printf("Item %d -> Bin %d\n", items[i], count+1);
            count++;
        }
    }

    printf("Total bins = %d\n", count);
}

int main() {
    int items[] = {4, 8, 1, 4, 2, 1};
    int n = 6, cap = 10;

    firstFit(items, n, cap);

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
