#! /usr/bin/env python3
"""
Problem 45 - Project Euler
http://projecteuler.net/index.php?section=problems&id=045
"""
import math


def triangle(n):
    return n * (n + 1) / 2


def ispenta(pn):
    n = (1 + math.sqrt(24 * pn + 1)) / 6
    return n.is_integer()


def ishexa(hn):
    n = (1 + math.sqrt(8 * hn + 1)) / 4
    return n.is_integer()


if __name__ == "__main__":
    n = 286
    while True:
        tn = triangle(n)
        if ispenta(tn) and ishexa(tn):
            print(n, int(tn))
            break
        n += 1
