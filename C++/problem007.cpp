/*
 * Problem 7 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=7
 */
#include <iostream>
#include <cmath>

bool isprime(int x) {
    int nmax = std::ceil(std::sqrt(x));
    if (x % 2 == 0) { 
        return false;
    }
    for (int i = 3; i <= nmax; i += 2) {
        if (x % i == 0) {
            return false;
        }
    }
    return true;
}

int main(int argc, char **argv) {
    int order = 1; // first prime is 2
    int p = 1;
    while(order < 10001) {
        p += 2;
        if (isprime(p)) {
            order++;
        }
    }
    std::cout << p << std::endl;
    return 0;
}
