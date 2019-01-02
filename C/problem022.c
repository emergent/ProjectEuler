/*
 * Problem 22 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=22
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static char* names[] = {
#include "data/p022_names.txt"
};

size_t names_count = sizeof(names) / sizeof(names[0]);

int strcmp_(const void* a, const void* b) {
    return strcmp(*(char**)a, *(char**)b);
}

void problem022() {
    int ans = 0;

    qsort(names, names_count, sizeof(char*), strcmp_);

    size_t name_len;
    int score;
    for (int i=0; i < names_count; i++) {
        score = 0;
        name_len = strlen(names[i]);
        for (int j=0; j < name_len; j++) {
            score += ((int)names[i][j] - 64);
        }
        score *= i + 1;
        ans += score;
    }

    printf("%s: answer = %d\n", __FUNCTION__, ans);
}

int main(int argc, char* argv[]) {
    problem022();
    return 0;
}
