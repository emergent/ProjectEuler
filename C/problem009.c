/*
 * Problem 9 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=009
 */
#include <stdio.h>

#define NUM_MAX 1000

void problem009() {
    int ans;
    int a, b, c;

    /* solve this problem here */
    a = 1;
    b = 1;
    c = 1;
    for (a = 1; a < NUM_MAX; a++) {
        for (b = a; b < NUM_MAX - a; b++) {
            c = NUM_MAX - a - b;
            if ((a * a) + (b * b) == c * c) {
                goto answer;
            }
        }
    }

answer:
    ans = a * b * c;
    printf("(a, b, c) = (%d, %d, %d)\n", a, b, c);
    printf("%s: answer = %d\n", __FUNCTION__, ans);
}

int main(int argc, char* argv[]) {
    problem009();
    return 0;
}
