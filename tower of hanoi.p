
#include <stdio.h>

// Recursive function to solve Tower of Hanoi
void towerOfHanoi(int n, char S, char D, char A) {

    // Base case
    if (n == 1) {
        printf("Move disk 1 from %c to %c\n", S, D);
        return;
    }

    // Move n-1 disks from Source to Auxiliary
    towerOfHanoi(n-1, S, A, D);

    // Move nth disk to Destination
    printf("Move disk %d from %c to %c\n", n, S, D);

    // Move n-1 disks from Auxiliary to Destination
    towerOfHanoi(n-1, A, D, S);
}

int main() {
    int n;

    printf("Enter number of disks: ");
    scanf("%d", &n);

    printf("Required moves:\n");

    towerOfHanoi(n, 'S', 'D', 'A');

    return 0;
}
Sample output:
1. Tower of Hanoi
Program:
#include <stdio.h>

// Recursive function to solve Tower of Hanoi
void towerOfHanoi(int n, char S, char D, char A) {

    // Base case
    if (n == 1) {
        printf("Move disk 1 from %c to %c\n", S, D);
        return;
    }

    // Move n-1 disks from Source to Auxiliary
    towerOfHanoi(n-1, S, A, D);

    // Move nth disk to Destination
    printf("Move disk %d from %c to %c\n", n, S, D);

    // Move n-1 disks from Auxiliary to Destination
    towerOfHanoi(n-1, A, D, S);
}

int main() {
    int n;

    printf("Enter number of disks: ");
    scanf("%d", &n);

    printf("Required moves:\n");

    towerOfHanoi(n, 'S', 'D', 'A');

    return 0;
}

/*
Sample output:
Enter number of disks: 3
Required moves:
Move disk 1 from S to D
Move disk 2 from S to A
Move disk 1 from D to A
Move disk 3 from S to D
Move disk 1 from A to S
Move disk 2 from A to D
Move disk 1 from S to D
*/
