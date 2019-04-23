#! /usr/bin/env ruby
=begin
Problem 43 - Project Euler
http://projecteuler.net/index.php?section=problems&id=43
=end
def all_divisible s
    [2, 3, 5, 7, 11, 13, 17]
        .lazy
        .map.with_index {|x, idx| s[idx+1, 3].to_i % x == 0 }
        .all?
end

puts ('0'..'9').to_a
        .permutation.map(&:join)
        .select {|sa| all_divisible(sa)}
        .map(&:to_i)
        .sum
