#! /usr/bin/env python3
'''
Problem 22 - Project Euler

Using <a href="project/resources/p022_names.txt">names.txt</a> (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?

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