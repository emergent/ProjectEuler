#! /usr/bin/env ruby
# Problem 1 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=1

def summul(n, x)
    count = n / x
    x * (count * (1 + count) / 2)
end

puts summul(999, 3) + summul(999, 5) - summul(999, 15)
