#! /usr/bin/env python3
'''
Problem 6 - Project Euler
http://projecteuler.net/index.php?section=problems&id=6
'''
from itertools import combinations
def diffs(xs):
    return 2 * sum(map(lambda t: t[0]*t[1], combinations(xs, 2)))

print(diffs(range(1, 101)))
