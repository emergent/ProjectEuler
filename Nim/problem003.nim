# Problem 3 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=3

proc maxprimefactor(n: int64): int64 =
    var x = n
    var p = 2
    while x != 1:
        if x mod p == 0:
            x = x div p
        else:
            if p != 2: p += 2 else: p += 1
    return p


const N = 600851475143
echo maxprimefactor(N)
