#! /usr/bin/env python3
'''
Problem 50 - Project Euler
http://projecteuler.net/index.php?section=problems&id=050
'''
from mathtools import primes

def maxconsecutiveprime(x):
    ps = primes(x)

    s = 0
    for i, p in enumerate(ps):
        s += p
        if s > x:
            break

    ps2 = ps[:i]
    l = len(ps2)
    for i in range(l)[::-1]:
        for j in range(l-i)[::-1]:
            pp = ps2[j:j+i+1]
            if sum(pp) in ps:
                return sum(pp), len(pp), pp

if __name__ == '__main__':
    print(*maxconsecutiveprime(1_000_000))
