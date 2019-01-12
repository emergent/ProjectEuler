#! /usr/bin/env python3
'''
Problem 32 - Project Euler
http://projecteuler.net/index.php?section=problems&id=032
'''
from itertools import permutations

def pandigitalproducts(s):
    prod = int(''.join(s[5:])) # 4-digits
    for i in (1,2,3):
        m1 = int(''.join(s[:i]))
        m2 = int(''.join(s[i:5]))
        if m1 * m2 == prod:
            return (m1, m2, prod)
    else:
        return None

if __name__ == '__main__':
    pp = filter(lambda x: x is not None,
                [pandigitalproducts(n) for n in permutations("123456789")])
    # sum only once by using set()
    print(sum(set(map(lambda x: print(x) or x[2], pp))))
