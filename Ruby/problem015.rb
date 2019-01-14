#! /usr/bin/env ruby
=begin
Problem 15 - Project Euler
http://projecteuler.net/index.php?section=problems&id=15
=end
puts (21..40).inject(:*)/(1..20).inject(:*)
