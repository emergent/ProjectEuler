#! /usr/bin/env ruby
=begin
Problem 40 - Project Euler
http://projecteuler.net/index.php?section=problems&id=40
=end

ns =
  (1..).lazy.flat_map do |i|
    i.to_s.chars.map(&:to_i)
  end.first(1_000_000)
puts (0..6).map { |i| ns[10**i - 1] }.inject(:*)
