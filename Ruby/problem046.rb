#! /usr/bin/env ruby
=begin
Problem 46 - Project Euler
http://projecteuler.net/index.php?section=problems&id=46
=end
require 'prime'

def goldbach x
    not (1..Math.sqrt(x/2).to_i+1)
        .map {|i| x - (i * i * 2) }
        .select {|i| i > 0 }
        .select(&:prime?)
        .empty?
end

puts (9..).step(2)
    .lazy
    .select {|x| !x.prime? && !goldbach(x)}
    .first
