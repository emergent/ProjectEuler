#! /usr/bin/env ruby
=begin
Problem 16 - Project Euler
http://projecteuler.net/index.php?section=problems&id=016
=end
NUM_TIMES = 1000
a = (2 ** NUM_TIMES).to_s
sum = 0
a.size.times {|i| sum += a[i].chr.to_i }
puts sum
