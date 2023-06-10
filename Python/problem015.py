#! /usr/bin/env python3
"""
Problem 15 - Project Euler
http://projecteuler.net/index.php?section=problems&id=015
"""
from math import factorial

if __name__ == "__main__":
    # calc 40_C_20
    m = 40
    n = 20
    print(int(factorial(m) / (factorial(m - n) * factorial(n))))
