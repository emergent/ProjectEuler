/*
 * Problem 6 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=6
 */
#include <iostream>

int main(int argc, char **argv) {
    int sqsum = 0;
    int sum = 0;

    for(int i = 1; i <= 100; i++) {
        sqsum += i * i;
        sum   += i;
    }

    std::cout << (sum * sum) - sqsum << std::endl;
    return 0;
}
