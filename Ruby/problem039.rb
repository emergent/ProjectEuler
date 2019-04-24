#! /usr/bin/env ruby
=begin
Problem 39 - Project Euler
http://projecteuler.net/index.php?section=problems&id=39
=end
class Integer
    def pythagorean_triplet
        (4..self-1).flat_map {|b|
            (3..b-1).map {|a| [a, b, self]}
        }.select {|a,b,c| a*a + b*b == c*c }
    end
end

pp (5..500).flat_map(&:pythagorean_triplet)
            .select {|a| a.size > 0 && a.sum <= 1000}
            .map(&:sum)
            .inject(Hash.new(0)) {|hash, x| hash[x] += 1; hash }
            .to_a
            .max_by {|item| item[1] }[0]
