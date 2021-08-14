#! /usr/bin/env ruby
# Problem 5 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=5

def gcd(x, y)
  x == 0 ? y : gcd(y % x, x)
end

def lcm(x, y)
  x * y // gcd(x, y)
end

puts (1_i64..20).reduce { |acc, x| lcm(acc, x) }
