#! /usr/bin/env python3
'''
Problem 21 - Project Euler

Let d(<i>n</i>) be defined as the sum of proper divisors of <i>n</i> (numbers less than <i>n</i> which divide evenly into <i>n</i>).<br>
If d(<i>a</i>) = <i>b</i> and d(<i>b</i>) = <i>a</i>, where <i>a</i> ≠ <i>b</i>, then <i>a</i> and <i>b</i> are an amicable pair and each of <i>a</i> and <i>b</i> are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.

http://projecteuler.net/index.php?section=problems&id=021
'''
import math
from itertools import chain

def getDivisors(x):
    dv = []
    for i in range(1, math.ceil(math.sqrt(x))):
        if x % i == 0:
            dv.append(i)
            dv.append(x // i)
    return dv

def d(x):
    return sum(getDivisors(x)) - x

def getAmicablePair(x):
    if x == 1:
        return ()

    dx = d(x)
    if (x < 10000 and x != dx and x == d(dx)):
        return (x, dx)
    else:
        return ()

if __name__ == '__main__':
    anslist = set(getAmicablePair(i) for i in range(1, 10000))
    print(anslist)
    print(sum(set(chain.from_iterable(anslist))))
