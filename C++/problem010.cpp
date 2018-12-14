/*
 * Problem 10 - Project Euler
 * http://projecteuler.net/index.php?section=problems&id=10
 */
#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>
#include <numeric>

template <typename T>
void print(std::vector<T> v) {
    std::cout << '[';
    for (const auto i : v) {
        std::cout << i << ' ';
    }
    std::cout << ']' << std::endl;
}

template <typename T>
void print(T x) {
    std::cout << x << std::endl;
}

std::vector<long>
sieve(long n, long maxn, std::vector<long> &v) {
    long k = v[n];
    if (k > maxn) {
        return v;
    } else {
        std::vector<long> copied = {};
        std::copy_if(v.cbegin(), v.cend(), std::back_inserter(copied), [k](long x) { return x==k || x % k != 0; });
        return sieve(n+1, maxn, copied);
    }
}

std::vector<long> primes(long x) {
    if (x < 2) {
        return {};
    } else if (x == 2) {
        return {2};
    } else {
        std::vector<long> v = {};
        for (int i = 3; i < x+1; i+=2) {
            v.push_back(i);
        }
        v = sieve(0, std::floor(std::sqrt(x)+1), v);
        std::reverse(v.begin(), v.end());
        v.push_back(2);
        std::reverse(v.begin(), v.end());
        return v;
    }
}

int main(int argc, char **argv) {
    std::vector<long> v = primes(2 * 1000 * 1000);
    std::cout << std::reduce(v.begin(), v.end()) << std::endl;
    return 0;
}
