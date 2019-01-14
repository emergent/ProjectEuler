#! /usr/bin/env ruby
=begin
Problem 27 - Project Euler
http://projecteuler.net/index.php?section=problems&id=27
=end
require 'prime'
def count_primes(a,b)
    n = 0
    while (n**2 + a*n + b).prime?
        n += 1
    end
    n
end

puts (-999..999).flat_map {|a|
    (2..1000).select {|b| b.prime? }.map {|b|
        [a, b, count_primes(a,b)]
    }
}.max {|x,y| x[2] <=> y[2]}.take(2).inject(:*)
