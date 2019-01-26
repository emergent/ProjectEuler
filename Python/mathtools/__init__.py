# methods for solving Project Euler
# https://projecteuler.net/

import math
import numpy as np

def isprime(x):
    if x == 2:
        return True
    elif not isinstance(x, int) or x < 2 or x % 2 == 0:
        return False
    else:
        return all([x % i != 0 for i in range(3, int(x**0.5)+1, 2)])

def primes(maxnum):
    if maxnum < 2:
        return []
    elif maxnum == 2:
        return [2]
    else:
        ps = np.array([], dtype=np.int32)
        target = np.array(range(2, maxnum+1), dtype=np.int32)
        i = target[0]
        while i * i <= maxnum:
            ps = np.append(ps, i)
            target = target[target%i!=0]
            i = target[0]
        ps = list(ps)
        ps.extend(list(target))
        return ps

def rotate(x):
    '''
    rotate the number. e.g. 152 -> 521
    '''
    a = list(str(x))
    return int(''.join(a[1:]+[a[0]]))
