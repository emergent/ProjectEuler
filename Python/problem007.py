#! /usr/bin/env python3
"""
Problem 7 - Project Euler
http://projecteuler.net/index.php?section=problems&id=7
"""
from mathtools import primes

NUM = 10_001

if __name__ == "__main__":
    pmax = 200000
    ps = primes(pmax)
    print(str(ps[NUM - 1]) + " is the {}st prime number.".format(NUM))
