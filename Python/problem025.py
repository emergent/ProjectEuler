#! /usr/bin/env python3
"""
Problem 25 - Project Euler
http://projecteuler.net/index.php?section=problems&id=025
"""


def fibonacci():  # generator
    a, b, i = 1, 1, 1
    while True:
        yield i, a
        a, b = b, a + b
        i = i + 1


if __name__ == "__main__":
    maxdigits = 1000
    fib = fibonacci()
    i, f = next(fib)
    while len(str(f)) < maxdigits:
        i, f = next(fib)
    print(i, f)
