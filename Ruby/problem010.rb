#! /usr/bin/env ruby
=begin
Problem 10 - Project Euler
http://projecteuler.net/index.php?section=problems&id=10
=end
require 'prime'
puts Prime.each(2_000_000 - 1).to_a.sum
