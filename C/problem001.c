/*
 * Problem 1 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=001
 */
#include <math.h>
#include <stdio.h>

void problem001() {
    int ans, i;

    ans = 0;
    for (i = 0; i < 1000; i++) {
        if ((i % 3 == 0) || (i % 5 == 0)) {
            ans += i;
        }
    }

    printf("%s: answer = %d\n", __FUNCTION__, ans);
}

int main(int argc, char* argv[]) {
    problem001();
    return 0;
}
