/*
 * Problem 2 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=002
 */
#include <stdio.h>

#define TERM_MAX 4000000

void problem002() {
    int ans, val, a, b;

    /* solve this problem here */
    ans = 0;
    val = 0;
    a = 1;
    b = 2;
    ans += b;
    while (val <= TERM_MAX) {
        if ((val % 2) == 0) {
            ans += val;
        }
        val = a + b;
        a = b;
        b = val;
    }

    printf("%s: answer = %d\n", __FUNCTION__, ans);
}

int main(int argc, char* argv[]) {
    problem002();
    return 0;
}
