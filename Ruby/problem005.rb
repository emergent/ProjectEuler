#! /usr/bin/env ruby
=begin
Problem 5 - Project Euler
http://projecteuler.net/index.php?section=problems&id=5
=end
puts (1..20).inject {|acc,x| acc.lcm(x)}
