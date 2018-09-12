#! /usr/bin/env python3
'''
Problem 26 - Project Euler
http://projecteuler.net/index.php?section=problems&id=026
'''
from mathtools import primes

def countcycle(x):
    count, n = 0, 1
    while n % x == n:
        count += 1
        n = n * 10
    while n % x != 1:
        if n % x == 0:
            return 0
        count += 1
        n = (n % x) * 10
    return count

if __name__ == '__main__':
    n = 1000
    ps = primes(n)
    ps.remove(2)
    ps.remove(5)
    cclist = map(lambda x: (x, countcycle(x)), ps)
    print(max(cclist, key=(lambda x: x[1])))
