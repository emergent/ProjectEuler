#! /usr/bin/env python3
'''
Problem 23 - Project Euler

A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number <var>n</var> is called deficient if the sum of its proper divisors is less than <var>n</var> and it is called abundant if this sum exceeds <var>n</var>.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

http://projecteuler.net/index.php?section=problems&id=023
'''
import math

def getDivisors(x):
    dv = []
    for i in range(1, int(math.sqrt(x))+1):
        if x % i == 0:
            dv.append(i)
            dv.append(x // i)
    return list(set(dv))

def isAbundant(x):
    return x < (sum(getDivisors(x)) - x)

if __name__ == '__main__':
    limit = 28123 + 1
    abundants = list(filter(isAbundant, range(1,limit)))
    sumoftwoab = set(x+y for i, x in enumerate(abundants)
                         for y in abundants[i:]
                         if x+y < limit)
    print(sum(set(range(1,limit))-sumoftwoab))
