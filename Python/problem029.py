#! /usr/bin/env python3
'''
Problem 29 - Project Euler
http://projecteuler.net/index.php?section=problems&id=029
'''
if __name__ == '__main__':
    ans = len(set([a ** b for a in range(2, 101) for b in range(2, 101)]))
    print(ans)
