#! /usr/bin/env ruby
=begin
Problem 38 - Project Euler
http://projecteuler.net/index.php?section=problems&id=38
=end

class Integer
    def pandigital_9digits?
        self.to_s.chars.map(&:to_i).push(0).uniq.size == 10
    end
end

puts (9183..9999).map {|i| [i, i*2].map(&:to_s).join.to_i }
                .select(&:pandigital_9digits?)
                .max
