#! /usr/bin/env python3
"""
Problem 32 - Project Euler
http://projecteuler.net/index.php?section=problems&id=032
"""
from itertools import permutations


def joint(s: list[str]) -> int:
    return int("".join(s))


if __name__ == "__main__":
    ans_set = {
        joint(p[5:9])
        for p in permutations("123456789")
        for i in (1, 2)
        if joint(p[:i]) * joint(p[i:5]) == joint(p[5:9])
    }
    print(sum(ans_set))
