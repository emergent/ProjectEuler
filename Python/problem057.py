#! /usr/bin/env python3
'''
Problem 57 - Project Euler
http://projecteuler.net/index.php?section=problems&id=057
'''
from fractions import Fraction

def gen_newton(x, loop=10):
    t = 0
    xn = 1 + Fraction(1, x)
    while t < loop:
        yield xn.numerator, xn.denominator
        xn =  1 + Fraction(1, xn + 1)
        t += 1

def countdigits(x):
    return len(str(x))

if __name__ == '__main__':
    anslist = [Fraction(n, d) for (n, d) in gen_newton(2, 1000) if countdigits(n) > countdigits(d)]
    print(len(anslist))
