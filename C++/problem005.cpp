/*
 * Problem 5 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=5
 */
#include <iostream>
#include <numeric>

int main(int argc, char **argv) {
    int ans = 1;
    for (int i = 1; i <= 20; i++) {
        ans = std::lcm(ans, i);
    }
    std::cout << ans << std::endl;
    return 0;
}
