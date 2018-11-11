#! /usr/bin/env ruby
=begin
Problem 20 - Project Euler
http://projecteuler.net/index.php?section=problems&id=020
=end
fa = 1
100.downto(1) {|i| fa *= i }
puts fa.to_s.split('').inject(0) {|res,i| res += i.to_i }
