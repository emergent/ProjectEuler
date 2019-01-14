#! /usr/bin/env ruby
=begin
Problem 29 - Project Euler
http://projecteuler.net/index.php?section=problems&id=29
=end
puts (2..100).to_a.product((2..100).to_a).map {|x| x[0]**x[1] }.uniq.size
