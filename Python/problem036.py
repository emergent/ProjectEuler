#! /usr/bin/env python3
'''
Problem 36 - Project Euler
http://projecteuler.net/index.php?section=problems&id=036
'''
def isPalindromicIn10(x):
    return str(x) == str(x)[::-1]

def isPalindromicInBinary(x):
    return bin(x)[2:] == bin(x)[2:][::-1]

def isPalindromicIn2Bases(x):
    return isPalindromicIn10(x) and isPalindromicInBinary(x)

if __name__ == '__main__':
    print(sum(i for i in range(1,1_000_000) if isPalindromicIn2Bases(i)))
