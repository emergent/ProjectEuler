#! /usr/bin/env python3
"""
Problem 24 - Project Euler
http://projecteuler.net/index.php?section=problems&id=024
"""
import math
from itertools import product


def lexperm(xs):
    xs = list(map(str, xs))
    lenxs = len(xs)
    xsprod = map("".join, product(xs, repeat=lenxs))
    return sorted(filter(lambda x: len(set(x)) == lenxs, xsprod))


if __name__ == "__main__":
    # precomputed:
    #  8! = 40320
    #  1000000 / 40320 => 24(quot)
    #  25th top-2-value is 27
    paramlist = list(range(0, 10))
    paramlist.remove(2)
    paramlist.remove(7)
    lp = lexperm(paramlist)

    print(len(lp))
    target = lp[1_000_000 - 1 - 24 * len(lp)]
    print("27" + target)
