#! /usr/bin/env python3
'''
Problem 14 - Project Euler
http://projecteuler.net/index.php?section=problems&id=014
'''
import math

def getCollatzChain(n):
    chain = [n]
    while n != 1:
        if (n % 2 == 0): # even
            n = n // 2
        else:            # odd
            n = n * 3 + 1
        chain.append(n)
    return chain

if __name__ == '__main__':
    ans, maxchain = 0, 0
    for i in range(1, 1_000_000):
        chain = getCollatzChain(i)
        if len(chain) > maxchain:
            ans, maxchain = i, len(chain)
    print(ans, maxchain)
