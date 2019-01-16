#! /usr/bin/env ruby
=begin
Problem 34 - Project Euler
http://projecteuler.net/index.php?section=problems&id=34
=end
puts (3..((1..9).inject(:*)*7)).select {|i|
    i == i.to_s.chars.map {|c|
        d = c.to_i; d > 0 ? (1..d).inject(:*) : 1
    }.sum
}.sum
