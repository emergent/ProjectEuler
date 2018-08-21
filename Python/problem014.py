#! /usr/bin/env python3
'''
Problem 14 - Project Euler

The following iterative sequence is defined for the set of positive integers:

<var>n</var> → <var>n</var>/2 (<var>n</var> is even)<br><var>n</var> → 3<var>n</var> + 1 (<var>n</var> is odd)

Using the rule above and starting with 13, we generate the following sequence:

<div style="text-align:center;">13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1</div>
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

<b>NOTE:</b> Once the chain starts the terms are allowed to go above one million.



http://projecteuler.net/index.php?section=problems&id=014
'''
import math

def getCollatzChain(n):
    init = n
    chain = [n]
    while n != 1:
        if (n % 2 == 0): # even
            n = n // 2
        else:            # odd
            n = n * 3 + 1
        chain.append(n)
    #print(init, len(chain))
    return chain

if __name__ == '__main__':
    ans, maxchain = 0, 0
    for i in range(1, 1_000_000):
        chain = getCollatzChain(i)
        if len(chain) > maxchain:
            ans, maxchain = i, len(chain)
    print(ans, maxchain)
