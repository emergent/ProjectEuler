#! /usr/bin/env python3
'''
Problem 3 - Project Euler
http://projecteuler.net/index.php?section=problems&id=003
'''
import math
from mathtools import primes

def maxprimefactor(x):
    p = 2
    while x != 1:
        if x % p == 0:
            x = x // p
        else:
            p += 2 if p != 2 else 1
    return p

if __name__ == '__main__':
    N = 600851475143
    assert(maxprimefactor(2) == 2)
    assert(maxprimefactor(3) == 3)
    assert(maxprimefactor(5) == 5)
    assert(maxprimefactor(10) == 5)
    print(maxprimefactor(N))
