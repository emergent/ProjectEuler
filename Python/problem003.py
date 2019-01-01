#! /usr/bin/env python3
'''
Problem 3 - Project Euler
http://projecteuler.net/index.php?section=problems&id=003
'''
import math
from mathtools import primes

def maxprimefactor(x, ps):
    if len(ps) == 0:
        return x
    else:
        if x == ps[0]:
            return x
        elif x % ps[0] == 0:
            qx = x // ps[0]
            return maxprimefactor(qx, ps)
        else:
            return maxprimefactor(x, ps[1:])

if __name__ == '__main__':
    N = 600851475143
    print(maxprimefactor(N, primes(int(math.sqrt(N))+1)))
