#include <stdio.h>
extern int counter(int* arr, int length);

int main() {
    int arr[5] = {1, 2, 3, 4, 5};

    printf ("%d\n", counter(arr, 5));
}
