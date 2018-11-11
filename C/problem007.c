/*
 * Problem 7 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=007
 */
#include <stdio.h>
#include <math.h>

#define PRIME_ORDER 10001

int is_prime(int num) {
    int i;
    int check_max = (int)floor(sqrt(num));

    for (i=2; i<=check_max; i++) {
        if (num % i == 0) {
            return 0;
        }
    }
    return 1;
}

void problem007() {
    int ans;
    int num, pcount;

    /* solve this problem here */
    num = 1;
    pcount = 0;
    while (pcount < PRIME_ORDER) {
        num++;
        if (is_prime(num) > 0) {
            pcount++;
        }
    }
    ans = num;

    printf("%s: answer = %d\n", __FUNCTION__, ans);
}

int main(int argc, char* argv[]) {
    problem007();
    return 0;
}
