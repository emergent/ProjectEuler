#! /usr/bin/env python3
'''
Problem 30 - Project Euler
http://projecteuler.net/index.php?section=problems&id=030
'''
import math

def sum_digits_power(x, p):
    return sum(map(lambda y: int(y)**p, list(str(x))))

if __name__ == '__main__':
    # The number of digits is at most 6 because (9 ** 5) * 7 = 413343 < 1000000
    # and (9 ** 5) * 6 = 354294
    ans = [i for i in range(2, 354294) if i == sum_digits_power(i, 5)]
    print(sum(ans), ans)
