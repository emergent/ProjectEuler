#! /usr/bin/env python3
"""
Problem 23 - Project Euler
http://projecteuler.net/index.php?section=problems&id=023
"""


def is_abundant(x: int) -> bool:
    sum_div = 0
    i = 1
    while i * i <= x:
        if x % i == 0:
            sum_div += i
            m = x // i
            if m != i and x != m:
                sum_div += x // i
        i += 1

    return x < sum_div


if __name__ == "__main__":
    limit = 28123
    abundant_nums = list(filter(is_abundant, range(12, limit + 1)))
    sum_of_two_ab = set(
        x + y
        for i, x in enumerate(abundant_nums)
        for y in abundant_nums[i:]
        if x + y < limit
    )
    print(sum(set(range(1, limit)) - sum_of_two_ab))
