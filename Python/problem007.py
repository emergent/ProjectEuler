#! /usr/bin/env python3
'''
Problem 7 - Project Euler
http://projecteuler.net/index.php?section=problems&id=7
'''
import math

primes = []

def isPrime(num):
    if num < 2:
        return False
    elif num == 2:
        primes.append(num)
        return True
    else:
        maxnum = math.ceil(math.sqrt(num))
        for p in filter(lambda x: x <= maxnum, primes):
            if num % p == 0:
                return False
        else:
            #print(num)
            primes.append(num)
            return True

if __name__ == '__main__':
    num = 2
    count = 0
    while True:
        if isPrime(num):
            count += 1
            if count == 10_001:
                print(str(num)+' is the 10,001st prime number.')
                break
        num += 1
