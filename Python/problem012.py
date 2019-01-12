#! /usr/bin/env python3
'''
Problem 12 - Project Euler
http://projecteuler.net/index.php?section=problems&id=012
'''
import math

def getTriangleNumber(i):
    return int(((i+1)*(i+2))/2)

def getDivisors(x):
    dv = []
    for i in range(1, int(math.sqrt(x))+1):
        if x % i == 0:
            dv.append(i)
            dv.append(x // i)
    return list(set(dv))

if __name__ == '__main__':
    i = 0
    while True:
        tn = getTriangleNumber(i)
        dv = getDivisors(tn)
        if (len(dv) > 500):
            print(tn, len(dv))
            break
        i += 1
