#! /usr/bin/env python3
'''
Problem 44 - Project Euler
http://projecteuler.net/index.php?section=problems&id=044
'''
import math
from itertools import combinations

if __name__ == '__main__':
    N = 3000
    pentas = [int((n * (3*n - 1)) / 2) for n in range(1, N)]
    penta_pair = list(filter(lambda x: (x[0]+x[1]) in pentas and abs(x[0]-x[1]) in pentas, \
                      combinations(pentas, 2)))
    print(penta_pair[0])
    print(abs(penta_pair[0][0]-penta_pair[0][1]))
