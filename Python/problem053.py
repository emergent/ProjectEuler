#! /usr/bin/env python3
"""
Problem 53 - Project Euler
http://projecteuler.net/index.php?section=problems&id=053
"""
from math import factorial


def numcombi(n, r):
    ret = 1
    for i in range(r):
        ret = ret * (n - i)
    return int(ret / factorial(r))


if __name__ == "__main__":
    N = 10**6
    maxn = 100
    ans = 0
    for i in range(23, maxn + 1):
        for j in range(1, i + 1):
            if numcombi(i, j) > N:
                ans += 1
    print(ans)
