#! /usr/bin/env python3
"""
Problem 38 - Project Euler
http://projecteuler.net/index.php?section=problems&id=038
"""
digits = set(range(1, 10))


def isPandigital9digits(x):
    xs = set(map(int, set(str(x))))
    return xs == digits


if __name__ == "__main__":
    maxp = 918273645
    for i in range(9183, 10000):
        ps = int("".join([str(i * x) for x in range(1, 2 + 1)]))
        if isPandigital9digits(ps):
            maxp = max(maxp, ps)
    print(maxp)
