#! /usr/bin/env python3
"""
Problem 48 - Project Euler
http://projecteuler.net/index.php?section=problems&id=048
"""
if __name__ == "__main__":
    N = 1000
    print(str(sum(i**i for i in range(1, N + 1)))[-10:])
