#! /usr/bin/env python3
"""
Problem 21 - Project Euler
http://projecteuler.net/index.php?section=problems&id=021
"""
import math
from itertools import chain


def getDivisors(x):
    dv = []
    for i in range(1, int(math.sqrt(x)) + 1):
        if x % i == 0:
            dv.append(i)
            dv.append(x // i)
    return list(set(dv))


def d(x):
    return sum(getDivisors(x)) - x


def getAmicablePair(x):
    if x == 1:
        return ()

    dx = d(x)
    if x < 10000 and x != dx and x == d(dx):
        return (x, dx)
    else:
        return ()


if __name__ == "__main__":
    anslist = set(getAmicablePair(i) for i in range(1, 10000))
    print(anslist)
    print(sum(set(chain.from_iterable(anslist))))
