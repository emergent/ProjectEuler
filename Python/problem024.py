#! /usr/bin/env python3
"""
Problem 24 - Project Euler
http://projecteuler.net/index.php?section=problems&id=024
"""
from itertools import permutations


if __name__ == "__main__":
    ans = 0
    for x in list(permutations(range(10)))[1_000_000 - 1]:
        ans = ans * 10 + x
    print(ans)
