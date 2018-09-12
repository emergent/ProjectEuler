#! /usr/bin/env python3
'''
Problem 35 - Project Euler
http://projecteuler.net/index.php?section=problems&id=035
'''
from mathutil import primes

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




