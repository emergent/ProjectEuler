#! /usr/bin/env python3
'''
Problem 23 - Project Euler
http://projecteuler.net/index.php?section=problems&id=023
'''
import math

def getDivisors(x):
    dv = []
    for i in range(1, int(math.sqrt(x))+1):
        if x % i == 0:
            dv.append(i)
            dv.append(x // i)
    return list(set(dv))

def isAbundant(x):
    return x < (sum(getDivisors(x)) - x)

if __name__ == '__main__':
    limit = 28123 + 1
    abundants = list(filter(isAbundant, range(1,limit)))
    sumoftwoab = set(x+y for i, x in enumerate(abundants)
                         for y in abundants[i:]
                         if x+y < limit)
    print(sum(set(range(1,limit))-sumoftwoab))
