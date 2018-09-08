#! /usr/bin/env python3
'''
Problem 33 - Project Euler
http://projecteuler.net/index.php?section=problems&id=033
'''
from math import gcd
from functools import reduce
from operator  import mul

def is_digit_cancelling_fraction_pair(i, j):
    i_s = str(i)
    j_s = str(j)
    for s in i_s:
        if s in j_s and i_s[0] != i_s[1] and j_s[0] != j_s[1]:
            i2 = int(i_s.replace(s,''))
            j2 = int(j_s.replace(s,''))

            if i % 10 != 0 and j % 10 != 0 and \
               i / gcd(i,j) == i2 / gcd(i2,j2) and \
               j / gcd(i,j) == j2 / gcd(i2,j2):
                return True
    return False


if __name__ == '__main__':
    pairs = [(i, j) for i in range(10, 100) for j in range(i+1,100)]
    p2 = list(filter(lambda x: is_digit_cancelling_fraction_pair(*x), pairs))
    print(p2)
    jm = reduce(mul, map(lambda x: x[1]//gcd(*x), p2))
    im = reduce(mul, map(lambda x: x[0]//gcd(*x), p2))
    print(jm // gcd(im,jm))
