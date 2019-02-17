#! /usr/bin/env python3
'''
Problem 44 - Project Euler
http://projecteuler.net/index.php?section=problems&id=044
'''
import math

def is_penta(y):
    d = 1 + 24 * y
    d_sq = int(math.sqrt(d))
    if d_sq * d_sq == d and (d_sq + 1) % 6 == 0:
        return True
    return False

def penta(n):
    return int(n * (3 * n - 1) / 2)

if __name__ == '__main__':
    k = 2
    while True:
        pentas = [(penta(k), penta(j)) for j in range(1, k)
                   if is_penta(penta(k)+penta(j)) and
                      is_penta(penta(k)-penta(j))]
        if len(pentas) > 0:
            print(pentas[0])
            print('D = {}'.format(abs(pentas[0][1]-pentas[0][0])))
            break
        k += 1
