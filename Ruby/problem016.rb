#! /usr/bin/env ruby
=begin
Problem 16 - Project Euler
http://projecteuler.net/index.php?section=problems&id=016
=end
puts (2 ** 1000).to_s.split('').map {|d| d.to_i }.sum
