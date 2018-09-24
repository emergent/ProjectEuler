#! /usr/bin/env python3
'''
Problem 49 - Project Euler
http://projecteuler.net/index.php?section=problems&id=049
'''
from mathtools import primes
from itertools import combinations
from functools import reduce
from operator  import add

def samedigits(*xs):
    if len(xs) < 2:
        return True
    x = set(str(xs[0]))
    return all([set(str(y)) == x for y in xs[1:]])

def isarithmetical(*xs):
    if len(xs) < 2:
        return True
    xs = list(sorted(xs))
    ys = [xs[i+1]-xs[i] for i in range(len(xs)-1)]
    return all([z == ys[0] for z in ys[1:]])

if __name__ == '__main__':
    N = 9999    
    ps = list(filter(lambda x: x > 999, primes(N)))
    ans = [c for c in combinations(ps,3) if samedigits(*c) and isarithmetical(*c)]
    print(ans)
    print(list(map(lambda x: reduce(add, map(str, x)), ans)))


    
