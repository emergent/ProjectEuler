#! /usr/bin/env ruby
=begin
Problem 20 - Project Euler
http://projecteuler.net/index.php?section=problems&id=020
=end
puts (1..100).inject(:*).to_s.chars.map(&:to_i).sum
