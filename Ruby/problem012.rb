#! /usr/bin/env ruby
=begin
Problem 12 - Project Euler
http://projecteuler.net/index.php?section=problems&id=12
=end
require 'prime'

def triangledivs(i)
    ((i+1)*(i+2)/2).prime_division.inject(1) {|acc,x| acc * (x[1]+1)}
end

i = 0
while triangledivs(i) < 500
    i += 1
end
puts ((i+1)*(i+2)/2)




