#! /usr/bin/env python3
"""
Problem 4 - Project Euler
http://projecteuler.net/index.php?section=problems&id=004
"""
from itertools import combinations_with_replacement


def palindrome(x, y):
    p = x * y
    return p if p == int(str(p)[::-1]) else 0


if __name__ == "__main__":
    print(
        max(
            {
                palindrome(*c)
                for c in combinations_with_replacement(range(100, 1000)[::-1], 2)
            }
        )
    )
