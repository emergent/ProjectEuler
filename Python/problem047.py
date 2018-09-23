#! /usr/bin/env python3
'''
Problem 47 - Project Euler
http://projecteuler.net/index.php?section=problems&id=047
'''
import mathtools

primes = mathtools.primes(1_000_000)

def primefactors(x):
    ret = set()
    if x in primes or x == 1:
        return ret

    for p in primes:
        if x == 1:
            return ret
        while True:
            if x % p == 0:
                ret.add(p)
                x = x // p
            else:
                break
            
if __name__ == '__main__':
    n = 100000
    L = 4 # num of prime factors
    K = 4 # consequtive num
    ans = []
    while True:
        np = primefactors(n)
        if len(np) == L:
            ans.append((n, np))
            for i in range(1, K):
                nk = primefactors(n+i)
                if len(nk) != L:
                    ans = []
                    n += i
                    break
                else:
                    ans.append((n+i, nk))
            else:
                print(ans)
                break
        n += 1

