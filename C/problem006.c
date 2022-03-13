/*
 * Problem 6 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=006
 */
#include <stdio.h>

#define NUM_MAX 100

int sumsq(int max) {
    int i, ret;
    ret = 0;
    for (i = 1; i <= max; i++) {
        ret += i * i;
    }
    return ret;
}

int sum(int max) { return (((1 + max) * max) / 2); }

void problem006() {
    int ans, s;

    /* solve this problem here */
    s = sum(NUM_MAX);
    ans = s * s - sumsq(NUM_MAX);

    printf("%s: answer = %d\n", __FUNCTION__, ans);
}

int main(int argc, char* argv[]) {
    problem006();
    return 0;
}
