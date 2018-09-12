#! /usr/bin/env python3
'''
Problem 27 - Project Euler
http://projecteuler.net/index.php?section=problems&id=027
'''
from mathtools import isprime
from itertools import permutations

def prime_generator(a, b):
    n = 0
    while True:
        yield n ** 2 + a * n + b
        n = n + 1

def count_primes(a, b):
    pg = prime_generator(a, b)
    for i, n in enumerate(pg):
        if not isprime(n):
            return i

if __name__ == '__main__':
    ans = (0, 0, 0) # answer: a, b, num_of_primes
    for a in range(-999, 999): # a
        for b in filter(isprime, range(2, 1000)): # b
            num_of_primes = count_primes(a, b)
            if num_of_primes > ans[2]:
                ans = (a, b, num_of_primes)
    print(ans)
    print(ans[0]*ans[1])
