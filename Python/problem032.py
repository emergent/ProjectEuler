#! /usr/bin/env python3
'''
Problem 32 - Project Euler
http://projecteuler.net/index.php?section=problems&id=032
'''
from itertools import permutations

def pandigitalproducts(x):
    sep = '|'
    pat = ''.join(map(str,range(1,x+1)))+sep*2
    perms = set(filter(lambda s: not(s[0] == sep or s[-1] == sep or sep*2 in s), 
                map(''.join, permutations(pat))))
    pps = [] # (multiplicand, multiplier, product)

    for p in perms:
        md, mr, pr = map(int, p.split(sep))
        if md * mr == pr:
            pps.append((md, mr, pr))

    print(pps)    
    return pps

if __name__ == '__main__':
    pp = pandigitalproducts(9)
    # sum only once by using set()
    print(sum(set(map(lambda x: x[2], pp))))
