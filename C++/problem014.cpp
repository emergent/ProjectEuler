/*
 * Problem 14 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=14
 */
#include <iostream>
#include <vector>
#include <algorithm>

long chain(long n) {
    if (n == 1) {
        return 1;
    } else if (n % 2 == 0) {
        return 1 + chain(n / 2);
    } else {
        return 1 + chain(3 * n + 1);
    }
}

int main(int argc, char **argv) {
    long maxn = 0;
    long maxi = 0;
    for (long i = 1; i < 1000000; i++) {
        long ci = chain(i);
        if (maxn < ci) {
            maxn = ci;
            maxi = i;
        }
    }
    std::cout << maxn << std::endl;
    std::cout << maxi << std::endl;
    return 0;
}
