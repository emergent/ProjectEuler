#! /usr/bin/env python3
'''
Problem 35 - Project Euler
http://projecteuler.net/index.php?section=problems&id=035
'''
from math import ceil, sqrt
def sieve(ps, k, nmax):
    n = ps[k]
    if n > nmax:
        return ps
    else:
        return sieve(list(filter((lambda x: x == n or x % n != 0), ps)),
                     k + 1, nmax)

def primes(maxnum):
    if maxnum < 2:
        return []
    elif maxnum == 2:
        return [2]
    else:
        return [2] + sieve(list(range(3, maxnum+1, 2)), 0, ceil(sqrt(maxnum)))

def rotate(x):
    a = list(str(x))
    return int(''.join(a[1:]+[a[0]]))

if __name__ == '__main__':
    ps = primes(1_000_000)
    ans, tmp = [], []

    print('num of primes: '+str(len(ps)))
    while len(ps) > 0:
        p = ps.pop(0)
        tmp.append(p)
        pr = rotate(p)
        while pr != p:
            if pr in ps:
                ps.remove(pr)
                tmp.append(pr)
                pr = rotate(pr)
            else:
                tmp = []
                break
        else:
            print(tmp)
            ans.extend(tmp)
            tmp = []
    print(ans)
    print(len(ans))




