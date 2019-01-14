#! /usr/bin/env ruby
=begin
Problem 24 - Project Euler
http://projecteuler.net/index.php?section=problems&id=24
=end
puts ('0'..'9').to_a.permutation.to_a[1_000_000-1].join
