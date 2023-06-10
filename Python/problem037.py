#! /usr/bin/env python3
"""
Problem 37 - Project Euler
http://projecteuler.net/index.php?section=problems&id=037
"""
from mathtools import isprime


def is_truncatable(x):
    xr = x // 10
    d = 10
    while xr > 0:
        xl = x % d
        if not (isprime(xr) and isprime(xl)):
            return False
        xr = xr // 10
        d *= 10
    return isprime(x)


if __name__ == "__main__":
    a = []
    i = 11
    while len(a) < 11:
        if is_truncatable(i):
            a.append(i)
        i += 2
    print(a)
    print(sum(a))
