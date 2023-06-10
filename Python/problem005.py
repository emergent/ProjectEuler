#! /usr/bin/env python3
"""
Problem 5 - Project Euler
http://projecteuler.net/index.php?section=problems&id=5
"""
from math import gcd
from functools import reduce


def lcm(a, b):
    return a * b // gcd(a, b)


print(reduce(lcm, range(1, 21)))
