#! /usr/bin/env python3
'''
Problem 6 - Project Euler
http://projecteuler.net/index.php?section=problems&id=6
'''
def diffs(xs):
    return sum(xs)**2 - sum(x**2 for x in xs)

print(diffs(range(1, 101)))