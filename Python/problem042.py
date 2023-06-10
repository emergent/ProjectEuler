#! /usr/bin/env python3
"""
Problem 42 - Project Euler
http://projecteuler.net/index.php?section=problems&id=042
"""
import math
import csv
from itertools import chain

filename = "data/p042_words.txt"
alphabets = {a: i + 1 for i, a in enumerate("abcdefghijklmnopqrstuvwxyz")}


def getAlphabeticalScore(word):
    return sum(alphabets[c] for c in word)


def triangleNumbers(nmax):
    return [i * (i + 1) / 2 for i in range(1, nmax + 1)]


if __name__ == "__main__":
    csv_file = open(filename)
    f = csv.reader(csv_file)
    fin = sorted(chain.from_iterable(f))
    csv_file.close()

    ans = 0
    tn = triangleNumbers(100)
    for w in fin:
        score = getAlphabeticalScore(w.rstrip().lower())
        if score in tn:
            ans += 1

    print(ans)
