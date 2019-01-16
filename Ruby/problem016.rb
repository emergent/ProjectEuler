#! /usr/bin/env ruby
=begin
Problem 16 - Project Euler
http://projecteuler.net/index.php?section=problems&id=016
=end
puts (2 ** 1000).to_s.chars.map(&:to_i).sum
