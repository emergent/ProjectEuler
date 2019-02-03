#! /usr/bin/env ruby
=begin
Problem 40 - Project Euler
http://projecteuler.net/index.php?section=problems&id=40
=end
puts (1..).lazy
          .flat_map {|i| i.to_s.chars }
          .first(1000000)
          .select
          .with_index {|c, idx|
            (1..6).map {|i| 10**i }
                  .to_a
                  .include? idx + 1
          }.map(&:to_i).inject(:*)
