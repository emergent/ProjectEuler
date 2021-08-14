#! /usr/bin/env ruby
# Problem 15 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=15
puts (21_u128..40_u128).reduce { |acc, x| acc * x }//(1_u128..20_u128).reduce { |acc, x| acc*x }
