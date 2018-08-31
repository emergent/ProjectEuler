#! /usr/bin/env python3
'''
Problem 26 - Project Euler


A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

<blockquote>
<table>
<tr>
<td>
<sup>1</sup>/<sub>2</sub>
</td>
<td>= </td>
<td>0.5</td>
</tr>
<tr>
<td>
<sup>1</sup>/<sub>3</sub>
</td>
<td>= </td>
<td>0.(3)</td>
</tr>
<tr>
<td>
<sup>1</sup>/<sub>4</sub>
</td>
<td>= </td>
<td>0.25</td>
</tr>
<tr>
<td>
<sup>1</sup>/<sub>5</sub>
</td>
<td>= </td>
<td>0.2</td>
</tr>
<tr>
<td>
<sup>1</sup>/<sub>6</sub>
</td>
<td>= </td>
<td>0.1(6)</td>
</tr>
<tr>
<td>
<sup>1</sup>/<sub>7</sub>
</td>
<td>= </td>
<td>0.(142857)</td>
</tr>
<tr>
<td>
<sup>1</sup>/<sub>8</sub>
</td>
<td>= </td>
<td>0.125</td>
</tr>
<tr>
<td>
<sup>1</sup>/<sub>9</sub>
</td>
<td>= </td>
<td>0.(1)</td>
</tr>
<tr>
<td>
<sup>1</sup>/<sub>10</sub>
</td>
<td>= </td>
<td>0.1</td>
</tr>
</table>
</blockquote>
Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that <sup>1</sup>/<sub>7</sub> has a 6-digit recurring cycle.

Find the value of <i>d</i> &lt; 1000 for which <sup>1</sup>/<sub><i>d</i></sub> contains the longest recurring cycle in its decimal fraction part.

http://projecteuler.net/index.php?section=problems&id=026
'''
from math import ceil, sqrt
def sieve(ps, k, nmax):
    n = ps[k]
    if n > nmax:
        return ps
    else:
        return sieve(list(filter((lambda x: x == n or x % n != 0), ps)),
                     k + 1, nmax)

def primes(maxnum):
    if maxnum < 2:
        return []
    elif maxnum == 2:
        return [2]
    else:
        return [2] + sieve(list(range(3, maxnum+1, 2)), 0, ceil(sqrt(maxnum)))

def countcycle(x):
    count, n = 0, 1
    while n % x == n:
        count += 1
        n = n * 10
    while n % x != 1:
        if n % x == 0:
            return 0
        count += 1
        n = (n % x) * 10
    return count

if __name__ == '__main__':
    n = 1000
    ps = primes(n)
    ps.remove(2)
    ps.remove(5)
    cclist = map(lambda x: (x, countcycle(x)), ps)
    print(max(cclist, key=(lambda x: x[1])))
