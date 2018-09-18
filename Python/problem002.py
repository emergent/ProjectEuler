#! /usr/bin/env python3
'''
Problem 2 - Project Euler
http://projecteuler.net/index.php?section=problems&id=002
'''
def fib(x):
    a, b = 1, 2
    f = []
    while a < x:
        f.append(a)
        a, b = b, a+b
    return f

if __name__ == '__main__':
    print(sum(x for x in fib(4_000_000) if x % 2 == 0))
