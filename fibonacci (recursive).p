#include <stdio.h>

// Recursive function to find nth Fibonacci term
int fib(int n) {
    // Base case
    if (n <= 1)
        return n;

    // Recursive case
    return fib(n-1) + fib(n-2);
}

int main() {
    int n;

    printf("Enter n: ");
    scanf("%d", &n);

    // Print nth Fibonacci term
    printf("Nth Fibonacci term = %d\n", fib(n));

    return 0;
}
/*
Sample Output:
Enter n: 5
Nth Fibonacci term = 5
*/
