#! /usr/bin/env python3
'''
Problem 20 - Project Euler

<i>n</i>! means <i>n</i> × (<i>n</i> − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,<br>and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!

http://projecteuler.net/index.php?section=problems&id=20
'''
from functools import reduce
from operator import mul

if __name__ == '__main__':
    print(sum(map(int, list(str(reduce(mul, range(1,101)))))))