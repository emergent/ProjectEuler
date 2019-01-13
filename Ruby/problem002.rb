#! /usr/bin/env ruby
=begin
Problem 2 - Project Euler
http://projecteuler.net/index.php?section=problems&id=2
=end

def fibevensum xmax
    a, b = 1, 2
    sum = 0
    while a < xmax
        sum += a if a.even?
        a, b = b, a + b
    end
    sum
end

puts fibevensum 4_000_000
