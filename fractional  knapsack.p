#include <stdio.h>

struct Item {
    int weight, value;
    float ratio;
};

// Sort items based on value/weight ratio (descending)
void sort(struct Item arr[], int n) {
    struct Item temp;
    for(int i = 0; i < n - 1; i++)
        for(int j = 0; j < n - i - 1; j++)
            if(arr[j].ratio < arr[j+1].ratio){
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
}

int main() {
    struct Item arr[3] = {{10,60,0},{20,100,0},{30,120,0}};
    int n = 3;
    float cap = 50, profit = 0;

    // Calculate ratio
    for(int i = 0; i < n; i++)
        arr[i].ratio = (float)arr[i].value / arr[i].weight;

    // Sort items by ratio
    sort(arr, n);

    // Select items greedily
    for(int i = 0; i < n; i++){
        if(cap >= arr[i].weight){
            profit += arr[i].value;
            cap -= arr[i].weight;
        } else {
            profit += arr[i].ratio * cap;
            break;
        }
    }

    printf("Maximum profit = %.2f\n", profit);
    return 0;
}
/*
Sample Output:
Maximum profit = 240.00
*/
