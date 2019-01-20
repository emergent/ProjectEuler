/*
 * Problem 2 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=002
 */
#include <iostream>

int fibevensum(int fmax) {
    int a = 1, b = 2, tmp;
    int sum = 0;
    while (b < fmax) {
        if (b % 2 == 0) {
            sum += b;
        }

        tmp = a;
        a = b;
        b = a + tmp;
    }
    return sum;
}

int main(int argc, char **argv) {
    std::cout << fibevensum(4 * 1000 * 1000) << std::endl;
    return 0;
}
