#! /usr/bin/env ruby
=begin
Problem 4 - Project Euler
http://projecteuler.net/index.php?section=problems&id=4
=end

def palindromic? x
    x.to_s.reverse == x.to_s
end

puts (100..999).to_a
        .combination(2)
        .map {|a| a[0] * a[1]}
        .select {|x| palindromic?(x) }
        .max
