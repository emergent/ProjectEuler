#! /usr/bin/env python3
'''
Problem 59 - Project Euler
http://projecteuler.net/index.php?section=problems&id=59
'''
from itertools import product

if __name__ == '__main__':
    with open('data/p059_cipher.txt') as f:
        asciis = list(map(int, f.read().strip().split(',')))

    lenasc = len(asciis)
    keylen = 3
    for c in product(range(ord('a'), ord('z')+1), repeat=keylen):
        cs = [c[i % keylen] for i in range(lenasc)]
        decry_i = list(map(lambda x,y: x ^ y, asciis, cs))

        if all([32 <= i and i <= 122 for i in decry_i]):
            decry_s = ''.join(map(chr, decry_i))
            if 'the' in decry_s:
                print(decry_s)
                print('key: '+''.join(map(chr,c)))
                print(sum(decry_i))
