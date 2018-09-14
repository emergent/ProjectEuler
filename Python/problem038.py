#! /usr/bin/env python3
'''
Problem 38 - Project Euler
http://projecteuler.net/index.php?section=problems&id=038
'''
import math

digits = set(range(1,10))

def isPandigital9digits(x):
    xs = set(map(int, set(str(x))))
    if len(xs) == 9 and xs == digits and len(str(x)) == 9:
        return True
    return False

if __name__ == '__main__':
    maxp = 918273645
    for i in range(9183, 10000):
        ps = int(''.join([str(i * x) for x in range(1, 2+1)]))
        if isPandigital9digits(ps):
            print(ps, i)
            maxp = max(maxp, ps)
    print(maxp)
