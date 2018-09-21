#! /usr/bin/env python3
'''
Problem 46 - Project Euler
http://projecteuler.net/index.php?section=problems&id=046
'''
import math
from mathtools import primes

if __name__ == '__main__':
    N = 1_000_0
    ps = primes(N)
    odd_composite_num = list(set(range(5, N+1, 2)) - set(ps))
    for i in odd_composite_num:
        for sq in range(1, int(math.sqrt(i/2))+1)[::-1]:
            if (i - 2 * (sq ** 2)) in ps:
                break
        else:
            print(i)
            break
