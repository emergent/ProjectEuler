/*
 * Problem 15 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=15
 */
#include <iostream>

long comb(long n, long k) {
    if (k == 1) {
        return n;
    } else {
        return comb(n, k - 1) * (n - k + 1) / k;
    }
}

int main(int argc, char **argv) {
    std::cout << comb(40, 20) << std::endl;
    return 0;
}
