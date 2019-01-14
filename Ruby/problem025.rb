#! /usr/bin/env ruby
=begin
Problem 25 - Project Euler
http://projecteuler.net/index.php?section=problems&id=25
=end
a, b, i = 1, 1, 1
while a.to_s.size < 1000
    a, b, i = b, a+b, i+1
end
puts i
