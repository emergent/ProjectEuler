#! /usr/bin/env ruby
=begin
Problem 23 - Project Euler
http://projecteuler.net/index.php?section=problems&id=23
=end
require 'prime'

class Integer
    def divisors
        return [] if self <= 0
        return [1] if self == 1
        self.prime_division
            .map {|a,b| (0..b).map {|i| a ** i }}
            .inject(&:product)
            .map {|a| [a].flatten.inject(&:*)}
            .sort
    end

    def is_abundant
        self < self.divisors.sum - self
    end
end

LIMIT = 28123
abundants = (1..LIMIT).select(&:is_abundant).sort
absum = abundants
        .flat_map {|x| abundants.select {|y| y >= x }
                                .map {|y| x + y }
                                .select {|s| s <= LIMIT} }
        .uniq
        .sum
puts (1..LIMIT).sum - absum
