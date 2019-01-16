#! /usr/bin/env ruby
=begin
Problem 3 - Project Euler
http://projecteuler.net/index.php?section=problems&id=3
=end
require 'prime'
puts 600851475143.prime_division.map {|a,_| a}.max
