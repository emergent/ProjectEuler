#! /usr/bin/env python3
'''
Problem 52 - Project Euler
http://projecteuler.net/index.php?section=problems&id=052
'''
def samedigits(x,y):
    return set(str(x)) == set(str(y))

if __name__ == '__main__':
    maxn = 6
    x = 1
    while True:
        for n in range(2, maxn+1):
            if not samedigits(x, x * n):
                break
        else:
            print([x * i for i in range(1, maxn+1)])
            break
        
        x += 1
