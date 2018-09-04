#! /usr/bin/env python3
'''
Problem 26 - Project Euler
http://projecteuler.net/index.php?section=problems&id=026
'''
from math import ceil, sqrt
def sieve(ps, k, nmax):
    n = ps[k]
    if n > nmax:
        return ps
    else:
        return sieve(list(filter((lambda x: x == n or x % n != 0), ps)),
                     k + 1, nmax)

def primes(maxnum):
    if maxnum < 2:
        return []
    elif maxnum == 2:
        return [2]
    else:
        return [2] + sieve(list(range(3, maxnum+1, 2)), 0, ceil(sqrt(maxnum)))

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
