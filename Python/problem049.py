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

if __name__ == '__main__':
    ps = list(filter(lambda x: x > 999, primes(9999)))
    cs = [c for c in combinations(ps,2) if samedigits(*c) and (2 * max(c) - min(c)) in ps]
    
    ans = []
    for c in cs:
        x, y = min(c), max(c)
        z = 2 * y - x
        if samedigits(x, y, z):
            ans.append((x, y, z))
    print(ans)
    print(list(map(lambda x: reduce(add, map(str, x)), ans)))
