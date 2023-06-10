#! /usr/bin/env python3
"""
Problem 44 - Project Euler
http://projecteuler.net/index.php?section=problems&id=044
"""
import math


def is_penta(y):
    d = 1 + 24 * y
    d_sq = int(math.sqrt(d))
    return d_sq * d_sq == d and (d_sq + 1) % 6 == 0


def penta(n):
    return int(n * (3 * n - 1) / 2)


if __name__ == "__main__":
    k = 2
    while True:
        pk = penta(k)
        pentas = [
            (pk, pj)
            for j in range(1, k)
            for pj in [penta(j)]
            if is_penta(pk + pj) and is_penta(pk - pj)
        ]

        if len(pentas) > 0:
            pk, pj = pentas[0]
            print(pk, pj)
            print("D = {}".format(abs(pk - pj)))
            break
        k += 1
