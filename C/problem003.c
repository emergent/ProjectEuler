/*
 * Problem 3 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=003
 */
#include <math.h>
#include <stdio.h>

#define TARGET_VALUE 600851475143LL

void problem003() {
    int ans;
    int divider;
    long long int target = TARGET_VALUE;
    double loop_max;

    /* solve this problem here */
    divider = 2;
    loop_max = floor(sqrt(target));
    while (divider <= loop_max) {
        if (target % divider == 0) {
            target /= divider;
            loop_max = floor(sqrt(target));
        } else {
            divider++;
        }
    }

    ans = (int)target;

    printf("%s: answer = %d\n", __FUNCTION__, ans);
}

int main(int argc, char* argv[]) {
    problem003();
    return 0;
}
