# Problem 1 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=1

proc summul(n: int, x: int): int =
    return x * (n div x) * (n div x + 1) div 2

const N = 1000 - 1
echo summul(N, 3) + summul(N, 5) - summul(N, 3 * 5)
