# methods for solving Project Euler
# https://projecteuler.net/

import math

def isprime(x):
    if x == 2:
        return True
    elif not isinstance(x, int) or x < 2 or x % 2 == 0:
        return False
    else:
        for i in primes(int(math.sqrt(x))+1):
            if x % i == 0:
                return False
        else:
            return True

def _sieve(ps, k, nmax):
    n = ps[k]
    if n > nmax:
        return ps
    else:
        return _sieve(list(filter((lambda x: x == n or x % n != 0), ps)),
                     k + 1, nmax)

def primes(maxnum):
    '''
    this function returns the list from 2 to the prime number less than or equal to `maxnum`.
    '''
    if maxnum < 2:
        return []
    elif maxnum == 2:
        return [2]
    else:
        return [2] + _sieve(list(range(3, int(maxnum)+1, 2)), 0, int(math.sqrt(maxnum)))

def rotate(x):
    '''
    rotate the number. e.g. 152 -> 521
    '''
    a = list(str(x))
    return int(''.join(a[1:]+[a[0]]))
