#! /usr/bin/env ruby
=begin
Problem 41 - Project Euler
http://projecteuler.net/index.php?section=problems&id=41
=end

require 'prime'
puts (1..7).to_a.permutation.lazy.map { |p|
       p.map(&:to_s).join.to_i
     }.sort
       .reverse
       .select(&:prime?)
       .first
