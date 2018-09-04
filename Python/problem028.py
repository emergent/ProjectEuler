#! /usr/bin/env python3
'''
Problem 28 - Project Euler
http://projecteuler.net/index.php?section=problems&id=028
'''
def sum_diagonals_n_by_n_spiral(n): # when n is odd number only
    return sum([4 * (x ** 2) - 6 * x + 6 for x in range(1, n+1, 2)]) - 3

if __name__ == '__main__':
    print(sum_diagonals_n_by_n_spiral(1001))
