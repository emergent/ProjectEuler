/*
 * Problem 9 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=9
 */
#include <iostream>
#include <cmath>

int main(int argc, char **argv) {
    for (int a = 1; a < 999; a++) {
        for (int b = a + 1; b < 1000; b++) {
            int a2b2 = a * a + b * b;
            int c = (int) (std::sqrt(a2b2));
            if (a2b2 == c * c && a + b + c == 1000) {
                std::cout << a << ", " << b << ", " << c << std::endl;
                std::cout << a * b * c << std::endl;
                return 0;
            }
        }
    }
}
