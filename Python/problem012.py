#! /usr/bin/env python3
"""
Problem 12 - Project Euler
http://projecteuler.net/index.php?section=problems&id=012
"""


def count_divisors(x: int) -> int:
    count = 0
    i = 1
    while i * i <= x:
        if x % i == 0:
            if i == x // i:
                count += 1
            else:
                count += 2
        i += 1
    return count


if __name__ == "__main__":
    num = 1
    i = 1
    while True:
        count = count_divisors(num)
        if count > 500:
            print(num, count)
            break
        i += 1
        num += i
