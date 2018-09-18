#! /usr/bin/env python3
'''
Problem 1 - Project Euler
http://projecteuler.net/index.php?section=problems&id=001
'''
if __name__ == '__main__':
    print(sum(filter(lambda x: x % 3 == 0 or x % 5 == 0, range(1, 1000))))
