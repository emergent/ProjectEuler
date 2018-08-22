#! /usr/bin/env python3
'''
Problem 16 - Project Euler

2<sup>15</sup> = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2<sup>1000</sup>?

http://projecteuler.net/index.php?section=problems&id=016
'''

if __name__ == '__main__':
    print(sum(map(int, list(str(2**1000)))))
