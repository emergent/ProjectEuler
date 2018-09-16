#! /usr/bin/env python3
'''
Problem 41 - Project Euler
http://projecteuler.net/index.php?section=problems&id=041
'''
from mathtools import isprime
from itertools import permutations

if __name__ == '__main__':
    digits = list(map(str, range(1,10)))
    while len(digits) > 2:
        for i in reversed(sorted(permutations(digits))):
            p = int(''.join(i))
            if isprime(p):
                print(p)
                exit(0)
        else:
            digits.pop()
    else:
        print('nothing')
