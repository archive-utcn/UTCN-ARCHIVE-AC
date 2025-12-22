#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define NDEBUG

void merge_sort(int *a, int p, int q) {

}

int main() {
    int numbers[] = {4, 9, 3, 1, 5, 7, 8, 6, 2};
    int expected[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

    int n = (int) (sizeof(numbers) / sizeof(int));
    merge_sort(numbers, 0, n);
    for (int i = 0; i < n; i++) {
        assert(numbers[i] == expected[i]);
    }
    return 0;
}