#! /usr/bin/env python3
'''
Problem 39 - Project Euler
http://projecteuler.net/index.php?section=problems&id=039
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
    pytha = []
    while True:
        a,b,c = getPythagoreanTriplet(x)
        if a+b+c > 1000:
            break
        else:
            if a != 0:
                print((a,b,c),a+b+c)
                pytha.append(a+b+c)
        x+=1
    
    maxp = (0, 0)
    for i in set(pytha):
        c = pytha.count(i)
        if c > maxp[0]:
            maxp = (c, i)

    print(maxp)
