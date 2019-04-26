#! /usr/bin/env ruby
=begin
Problem 45 - Project Euler
http://projecteuler.net/index.php?section=problems&id=45
=end
class Integer
    def triangle
        self * (self + 1) / 2
    end

    def penta?
        n = (1.0 + Math.sqrt(24.0 * self.to_f + 1.0)) / 6.0
        n == n.to_i
    end

    def hexa?
        n = (1.0 + Math.sqrt(8.0 * self.to_f + 1.0)) / 4.0
        n == n.to_i
    end
end

puts (286..).lazy
            .map(&:triangle)
            .select(&:penta?)
            .select(&:hexa?)
            .first


