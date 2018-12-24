#! /usr/bin/env python3
'''
Problem 20 - Project Euler
http://projecteuler.net/index.php?section=problems&id=20
'''
from math import factorial
if __name__ == '__main__':
    print(sum(map(int, list(str(factorial(100))))))
