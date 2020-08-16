# Problem 5 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=5

import math
var ans = 1
for i in 1..20:
    ans = lcm(ans, i)
echo ans
