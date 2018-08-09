#! /usr/bin/env python3
'''
Problem 9 - Project Euler

A Pythagorean triplet is a set of three natural numbers, <var>a</var> &lt; <var>b</var> &lt; <var>c</var>, for which,

<div style="text-align:center;"> <var>a</var><sup>2</sup> + <var>b</var><sup>2</sup> = <var>c</var><sup>2</sup>
</div>
For example, 3<sup>2</sup> + 4<sup>2</sup> = 9 + 16 = 25 = 5<sup>2</sup>.

There exists exactly one Pythagorean triplet for which <var>a</var> + <var>b</var> + <var>c</var> = 1000.<br>Find the product <var>abc</var>.



http://projecteuler.net/index.php?section=problems&id=9
'''
import math

def getPythagoreanTriplet(a):
    for b in reversed(range(1, a)):
        c = math.sqrt(a**2 - b**2)
        if c.is_integer():
            return (a,b,int(c))
    else:
        return (0, 0, 0)


if __name__ == '__main__':
    x = 5
    while True:
        a,b,c = getPythagoreanTriplet(x)
        if a > 0 and 1000 % (a+b+int(c))==0:
            q = 1000 // (a+b+int(c))
            a,b,c = map(lambda x: x*q, [a,b,c])
            print('abc='+str(a*b*c)+' (a,b,c)='+str(list([a,b,c])))
            break
        elif (a+b+c) > 1000:
            print(str(list([a,b,c])))
            break
        x += 1





