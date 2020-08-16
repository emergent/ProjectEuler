# Problem 4 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=4
from strutils import parseInt
import unicode

proc palindrome(p: int): bool =
    return p == reversed($p).parseInt

var ans = 0
for i in 100..999:
    for j  in i..999:
        echo i
        let p = i * j
        if palindrome(p):
            ans = max(ans, p)

echo ans
