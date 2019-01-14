#! /usr/bin/env ruby
=begin
Problem 30 - Project Euler
http://projecteuler.net/index.php?section=problems&id=30
=end
puts (100..(9**5*6)).select {|i|
    i.to_s.chars.map {|c| c.to_i ** 5 }.sum == i
}.sum
