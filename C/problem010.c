/*
 * Problem 10 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=010
 */
#include <stdio.h>
#include <math.h>

typedef long long int llong;
#define NUM_MAX 2000000

int is_prime(llong num) {
    llong i;

    if (num < 2) {
        return 0;
    } else if (num == 2) {
        return 1;
    }
    if (num % 2 == 0) {
        return 0;
    }
    for (i=3; i*i<=num; i+=2) {
        if (num % i == 0) {
            return 0;
        }
    }
    return 1;
}

void problem010() {
    llong ans;
    llong i;

    /* solve this problem here */
    ans = 0;
    for (i=2; i<=NUM_MAX; i++) {
        if (is_prime(i)>0) {
            ans += i;
        }
    }

    printf("%s: answer = %lld\n", __FUNCTION__, ans);
}

int main(int argc, char* argv[]) {
    problem010();
    return 0;
}
