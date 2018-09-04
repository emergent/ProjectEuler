#! /usr/bin/env python3
'''
Problem 22 - Project Euler
http://projecteuler.net/index.php?section=problems&id=022
'''
import math
import csv
from itertools import chain

filename = 'data/p022_names.txt'
alphabets = 'abcdefghijklmnopqrstuvwxyz'

def getAlphabeticalScore(c):
    return alphabets.index(c.lower()) + 1

if __name__ == '__main__':
    csv_file = open(filename)
    f = csv.reader(csv_file)
    fin = sorted(chain.from_iterable(f))

    ans = 0
    for i, v in enumerate(fin):
        score = (i+1) * sum(map(getAlphabeticalScore, list(v)))
        ans += score
    print(ans)