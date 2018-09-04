#! /usr/bin/env python3
'''
Problem 27 - Project Euler
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
