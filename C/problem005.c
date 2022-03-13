/*
 * Problem 5 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=005
 */
#include <stdio.h>

#define NUM_MAX 20
/* #define NUM_MAX 10 */

int divideall(int target) {
    int i;
    for (i = 2; i < NUM_MAX; i++) {
        if (target % i != 0) {
            return -1;
        }
    }
    return 0;
}

void problem005() {
    int ans;

    /* solve this problem here */
    ans = 1;
    while (divideall(ans) < 0) {
        ans++;
    }

    printf("%s: answer = %d\n", __FUNCTION__, ans);
}

int main(int argc, char* argv[]) {
    problem005();
    return 0;
}
