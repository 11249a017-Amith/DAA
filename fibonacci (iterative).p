#include <stdio.h>

int main() {
    int n, a = 0, b = 1, c;

    printf("Enter n: ");
    scanf("%d", &n);

    printf("Fibonacci Series: ");

    // Print first two terms if applicable
    if (n >= 1) printf("%d ", a);
    if (n >= 2) printf("%d ", b);

    // Generate remaining terms
    for (int i = 3; i <= n; i++) {
        c = a + b;
        printf("%d ", c);
        a = b;
        b = c;
    }

    // Print nth term
    printf("\nNth term = %d\n", (n == 1) ? a : b);

    return 0;
}

Sample output:
2. Fibonacci (Iterative)
    Program:
#include <stdio.h>

int main() {
    int n, a = 0, b = 1, c;

    printf("Enter n: ");
    scanf("%d", &n);

    printf("Fibonacci Series: ");

    // Print first two terms if applicable
    if (n >= 1) printf("%d ", a);
    if (n >= 2) printf("%d ", b);

    // Generate remaining terms
    for (int i = 3; i <= n; i++) {
        c = a + b;
        printf("%d ", c);
        a = b;
        b = c;
    }

    // Print nth term
    printf("\nNth term = %d\n", (n == 1) ? a : b);

    return 0;
}

/*
Sample output:
Enter n: 5
Fibonacci Series: 0 1 1 2 3 5
Nth term = 5
*/
