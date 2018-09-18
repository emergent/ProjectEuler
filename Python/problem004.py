#! /usr/bin/env python3
'''
Problem 4 - Project Euler
http://projecteuler.net/index.php?section=problems&id=004
'''
from itertools import combinations

def isPalindromic(x):
    return str(x) == str(x)[::-1]

if __name__ == '__main__':
    print(max(filter(isPalindromic, map(lambda x: x[0]*x[1], combinations(range(100,999), 2)))))
