#! /usr/bin/env python3
'''
Problem 3 - Project Euler
http://projecteuler.net/index.php?section=problems&id=003
'''
import math
from mathtools import primes

if __name__ == '__main__':
    N = 600851475143
    ps = primes(int(math.sqrt(N))+1)
    for i in ps[::-1]:
        if N % i == 0:
            print(i)
            break
