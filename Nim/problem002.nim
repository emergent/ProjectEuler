# Problem 2 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=2

proc fibevensum(max: int): int =
    var a = 1
    var b = 2
    while b < max:
        if b mod 2 == 0:
            result += b
        b = a + b
        a = b - a

echo fibevensum(4_000_000)
