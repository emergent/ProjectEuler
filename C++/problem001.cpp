/*
 * Problem 1 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=001
 */
#include <iostream>

int summul1(int n, int x) {
    return (x * (n / x) * (1 + n / x)) / 2;
}

int summul(int n, int x, int y) {
    return summul1(n, x) + summul1(n, y) - summul1(n, x * y);
}

int main(int argc, char **argv) {
    std::cout << summul(999, 3, 5) << std::endl;
    return 0;
}
