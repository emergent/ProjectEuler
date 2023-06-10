#! /usr/bin/env python3
"""
Problem 12 - Project Euler
http://projecteuler.net/index.php?section=problems&id=012
"""


def get_divisors(x):
    dv = []
    i = 1
    while i * i <= x:
        if x % i == 0:
            dv.append(i)
            dv.append(x // i)
        i += 1
    return list(set(dv))


if __name__ == "__main__":
    num = 1
    i = 1
    while True:
        dv = get_divisors(num)
        if len(dv) > 500:
            print(num, len(dv))
            break
        i += 1
        num += i
