#! /usr/bin/env ruby
=begin
Problem 28 - Project Euler
http://projecteuler.net/index.php?section=problems&id=28
=end

def sum_diagonals_n_by_n_spiral(n)
  return (1..n).step(2).map {|x|
    4 * (x**2) - 6 * x + 6
  }.sum - 3
end

puts sum_diagonals_n_by_n_spiral(1_001)
