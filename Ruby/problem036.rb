#! /usr/bin/env ruby
=begin
Problem 36 - Project Euler
http://projecteuler.net/index.php?section=problems&id=36
=end
puts (1..(1_000_000-1))
    .select {|x| xs = x.to_s; xs == xs.reverse }
    .select {|x| x2 = x.to_s(2); x2 == x2.reverse }
    .sum
