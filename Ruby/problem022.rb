#! /usr/bin/env ruby
=begin
Problem 22 - Project Euler
http://projecteuler.net/index.php?section=problems&id=22
=end
FILENAME = 'data/p022_names.txt'
names = open(FILENAME).read
puts names.gsub(/"/, '')
        .split(',')
        .sort
        .map
        .with_index {|name, idx|
            name.chars.map {|c| c.ord - 64 }.sum * (idx+1)
        }
        .sum
