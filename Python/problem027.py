#! /usr/bin/env python3
'''
Problem 27 - Project Euler

Euler discovered the remarkable quadratic formula:

$n^2 + n + 41$

It turns out that the formula will produce 40 primes for the consecutive integer values $0 \le n \le 39$. However, when $n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41$ is divisible by 41, and certainly when $n = 41, 41^2 + 41 + 41$ is clearly divisible by 41.

The incredible formula $n^2 - 79n + 1601$ was discovered, which produces 80 primes for the consecutive values $0 \le n \le 79$. The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

<blockquote>
$n^2 + an + b$, where $|a| &lt; 1000$ and $|b| \le 1000$<br><br><div>where $|n|$ is the modulus/absolute value of $n$<br>e.g. $|11| = 11$ and $|-4| = 4$</div>
</blockquote>
Find the product of the coefficients, $a$ and $b$, for the quadratic expression that produces the maximum number of primes for consecutive values of $n$, starting with $n = 0$.


http://projecteuler.net/index.php?section=problems&id=027
'''
import math
from itertools import permutations

def isPrime(x):
    if x == 2:
        return True
    elif x < 2 or x % 2 == 0:
        return False
    else:
        for i in range(3, int(math.sqrt(x))+1):
            if x % i == 0:
                return False
        else:
            return True

def prime_generator(a, b):
    n = 0
    while True:
        yield n ** 2 + a * n + b
        n = n + 1

def count_primes(a, b):
    pg = prime_generator(a, b)
    for i, n in enumerate(pg):
        if not isPrime(n):
            return i

if __name__ == '__main__':
    ans = (0, 0, 0) # answer: a, b, num_of_primes
    for a in range(-999, 999): # a
        for b in filter(isPrime, range(2, 1000)): # b
            num_of_primes = count_primes(a, b)
            if num_of_primes > ans[2]:
                ans = (a, b, num_of_primes)
    print(ans)
    print(ans[0]*ans[1])


    
