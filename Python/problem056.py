#! /usr/bin/env python3
"""
Problem 56 - Project Euler
http://projecteuler.net/index.php?section=problems&id=056
"""
import math


def digitalsum(x):
    return sum(map(int, list(str(x))))


if __name__ == "__main__":
    print(max([digitalsum(x**y) for x in range(100) for y in range(100)]))
