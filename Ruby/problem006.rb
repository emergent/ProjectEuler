#! /usr/bin/env ruby
=begin
Problem 6 - Project Euler
http://projecteuler.net/index.php?section=problems&id=6
=end

puts (1..100).sum.pow(2) - (1..100).inject {|sum,x| sum += x.pow(2)}
