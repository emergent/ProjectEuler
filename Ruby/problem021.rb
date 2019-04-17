#! /usr/bin/env ruby
=begin
Problem 21 - Project Euler
http://projecteuler.net/index.php?section=problems&id=21
=end
require 'prime'

class Integer
    def devisors
        return [0] if self <= 0
        return [1] if self == 1
        self.prime_division
            .map {|a,b| (0..b).map {|i| a ** i }}
            .inject(&:product)
            .map {|a| [a].flatten.inject(&:*)}
            .sort
    end

    def d
        self.devisors.sum - self
    end

    def amicable_pair
        dx = self.d
        dx.d == self && dx != self ? dx : nil
    end
end

puts (1..9999).map(&:amicable_pair).compact.select {|x| x < 10000 }.sum




