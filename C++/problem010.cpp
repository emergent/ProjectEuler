/*
 * Problem 10 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=10
 */
#include <iostream>
#include <vector>
#include <numeric>

std::vector<long> primes(long x) {
    std::vector<bool> is_p(x + 1, true);
    std::vector<long> ps;
    if (x >= 2) {
        for (long i = 2; i <= x; i++) {
            if (is_p[i]) {
                ps.push_back(i);
            }
            if (i * i <= x) {
                long max = x / i;
                for (long j = 2; j <= max; j++) {
                    is_p[i * j] = false;
                }
            }
        }
    }

    return ps;
}

int main(int argc, char **argv) {
    std::vector<long> v = primes(2 * 1000 * 1000);
    std::cout << std::reduce(v.begin(), v.end()) << std::endl;
    return 0;
}
