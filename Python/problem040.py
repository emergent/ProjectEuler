#! /usr/bin/env python3
"""
Problem 40 - Project Euler
http://projecteuler.net/index.php?section=problems&id=040
"""
from functools import reduce
from operator import mul

if __name__ == "__main__":
    s = ""
    i = 0
    while True:
        s += str(i)
        if len(s) > 1_000_000:
            break
        i += 1

    print(
        reduce(
            mul,
            map(
                int,
                [s[1], s[10], s[100], s[1_000], s[10_000], s[100_000], s[1_000_000]],
            ),
        )
    )
