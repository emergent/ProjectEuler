/*
 * Problem 3 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=003
 */
#include <iostream>

long maxprimefactor(long x) {
    long i = 2;
    while (i * i <= x) {
        if (x % i == 0) {
            x /= i;
        } else {
            i++;
        }
    }
    return x;
}

int main(int argc, char **argv) {
    std::cout << maxprimefactor(600851475143L) << std::endl;
    return 0;
}
