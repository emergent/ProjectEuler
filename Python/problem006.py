#! /usr/bin/env python3
'''
Problem 6 - Project Euler
http://projecteuler.net/index.php?section=problems&id=6
'''
if __name__ == '__main__':
    print(sum(range(1,101))**2 - sum([x**2 for x in range(1,101)]))
