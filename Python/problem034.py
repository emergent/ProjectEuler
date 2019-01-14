#! /usr/bin/env python3
'''
Problem 34 - Project Euler
http://projecteuler.net/index.php?section=problems&id=034
'''
from math import factorial
from multiprocessing import Pool
import numpy as np

def digitfact(x):
    return (x, x == sum(map(lambda i: factorial(int(i)), list(str(x)))))

if __name__ == '__main__':
    with Pool(8) as p:
        df = p.map(digitfact, range(3, factorial(9)*7))

    df = list(map(lambda y: y[0], filter(lambda x: x[1], df)))
    print(df)
    print(sum(df))
