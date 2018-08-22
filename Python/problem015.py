#! /usr/bin/env python3
'''
Problem 15 - Project Euler

Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

<div style="text-align:center;">
<img src="project/images/p015.gif" alt="">
</div>
How many such routes are there through a 20×20 grid?

http://projecteuler.net/index.php?section=problems&id=015
'''
import functools
import operator

def factorial(x):
    return functools.reduce(operator.mul, range(1,x+1))

if __name__ == '__main__':
    # calc 40_C_20
    m = 40
    n = 20
    print(int(factorial(m)/(factorial(m-n)*factorial(n))))
