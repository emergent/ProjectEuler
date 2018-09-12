#! /usr/bin/env python3
'''
Problem 37 - Project Euler
http://projecteuler.net/index.php?section=problems&id=037
'''
import math
from operator import and_
from functools import reduce

def isPrime(x):
    if x == 2:
        return True
    elif x < 2 or x % 2 == 0:
        return False
    else:
        for i in range(3, int(math.sqrt(x))+1):
            if x % i == 0:
                return False
        else:
            return True

def isTruncatable(x):
    a = [x]
    x_s = str(x)
    for i in range(1, len(x_s)):
        a.append(int(x_s[i:]))
        a.append(int(x_s[:-i]))
    return reduce(and_, map(isPrime, sorted(a)))

if __name__ == '__main__':
    a = []
    i = 11
    while True:
        if isTruncatable(i):
            a.append(i)
            print(a)
            if len(a) == 11:
                break
        i += 2
    print(sum(a))
        
