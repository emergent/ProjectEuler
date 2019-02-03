#! /usr/bin/env ruby
=begin
Problem 40 - Project Euler
http://projecteuler.net/index.php?section=problems&id=40
=end
indice = (0..6).map {|i| 10**i }
puts (1..).lazy
          .flat_map {|i| i.to_s.chars.map(&:to_i) }
          .first(1000000)
          .select
          .with_index {|_, idx| indice.include? idx + 1}
          .inject(:*)
