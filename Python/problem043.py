#! /usr/bin/env python3
'''
Problem 43 - Project Euler
http://projecteuler.net/index.php?section=problems&id=043
'''
import math
from itertools import permutations

denomi = [2, 3, 5, 7, 11, 13, 17]

def isdivisible(xs):
    for i in range(1,8): # 1 - 7
        ds = xs[i:i+3]
        if int(ds) % denomi[i-1] != 0:
            return False
    else:
        return True

if __name__ == '__main__':
    pandigitals = [''.join(x) for x in permutations("0123456789") if x[0] is not '0']
    divis = [p for p in pandigitals if isdivisible(p)]
    print(divis)
    print(sum(map(int, divis)))
