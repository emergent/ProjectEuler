#! /usr/bin/env python3
"""
Problem 1 - Project Euler
http://projecteuler.net/index.php?section=problems&id=001
"""


def summul(n, x):
    return int(x * (n // x) * (n // x + 1) / 2)


if __name__ == "__main__":
    N = 1000 - 1
    print(summul(N, 3) + summul(N, 5) - summul(N, 3 * 5))
