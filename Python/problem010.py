#! /usr/bin/env python3
"""
Problem 10 - Project Euler
http://projecteuler.net/index.php?section=problems&id=10
"""
from mathtools import primes

if __name__ == "__main__":
    print(sum(primes(2_000_000)))
