#! /usr/bin/env ruby
# Problem 16 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=016

require "big"
puts (BigInt.new(2) ** BigInt.new(1000)).to_s.chars.map { |x| x.to_i }.sum
