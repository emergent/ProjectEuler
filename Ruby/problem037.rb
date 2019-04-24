#! /usr/bin/env ruby
=begin
Problem 37 - Project Euler
http://projecteuler.net/index.php?section=problems&id=37
=end
require 'prime'
class Integer
    def truncatable?
        return false unless self.prime?
        x = y = self
        i = 1
        while x / (10 ** i) > 0
            return false unless (x / (10 ** i)).prime? && (y % (10 ** i)).prime?
            i += 1
        end
        true
    end
end

puts (11..).lazy.select(&:truncatable?).first(11).sum
