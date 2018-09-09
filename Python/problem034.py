#! /usr/bin/env python3
'''
Problem 34 - Project Euler
http://projecteuler.net/index.php?section=problems&id=034
'''
import math
from functools import reduce
from operator import mul

def factorial(x):
    return reduce(mul, range(1, x+1)) if x >= 1 else 1

def digitfact(x):
    return x == sum(map(lambda i: factorial(int(i)), list(str(x))))

if __name__ == '__main__':
    df = [x for x in range(3, 10000000) if digitfact(x)]
    print(df)
    print(sum(df))
