#! /usr/bin/env python3
"""
#51 Prime digit replacements - Project Euler
http://projecteuler.net/problem=51
"""


def is_prime(n: int) -> bool:
    if n < 2:
        return False
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            return False
    return True


def digit_replacements(n: int):
    digits = str(n)
    n_digits = len(digits)
    for i in range(n_digits - 1):
        for j in range(i + 1, n_digits):
            if digits[i] == digits[j]:
                continue
            for k in range(10):
                new_digits = (
                    digits[:i] + str(k) + digits[i + 1 : j] + str(k) + digits[j + 1 :]
                )
                yield int(new_digits)


if __name__ == "__main__":
    for n in range(100000, 1000000):
        if not is_prime(n):
            continue
        for m in digit_replacements(n):
            if is_prime(m):
                family = [m for m in digit_replacements(n) if is_prime(m)]
                if len(family) == 8:
                    print(family)
                    print(min(family))
                    exit()
