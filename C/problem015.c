/*
 * Problem 15 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=015
 */
#include <stdio.h>
#include <limits.h>
typedef long long int llong;

llong comb(llong n, llong k) {
    if (k == 1) {
        return n;
    } else {
        return ((n-k+1) * comb(n, k-1) / k);
    }
}

void problem015() {
    llong ans;

    /* solve this problem here */
    ans = comb(40, 20);

    printf("%s: answer = %lld\n", __FUNCTION__, ans);
    printf("%lld\n", __LONG_LONG_MAX__);
    printf("%lld\n", LLONG_MAX);
    printf("%ld\n", __LONG_MAX__);
    printf("%ld\n", LONG_MAX);
    printf("%d\n", INT_MAX);
}

int main(int argc, char* argv[]) {
    problem015();
    return 0;
}
