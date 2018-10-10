#! /usr/bin/env python3
'''
Problem 20 - Project Euler
http://projecteuler.net/index.php?section=problems&id=20
'''
from functools import reduce
from operator import mul

if __name__ == '__main__':
    print(sum(map(int, list(str(reduce(mul, range(1,101)))))))
