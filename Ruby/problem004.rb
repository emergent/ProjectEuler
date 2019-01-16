#! /usr/bin/env ruby
=begin
Problem 4 - Project Euler
http://projecteuler.net/index.php?section=problems&id=4
=end
class Integer
    def palindromic?
        self == self.to_s.reverse.to_i
    end
end

puts (100..999).to_a
        .combination(2)
        .map {|a, b| a * b}
        .select {|x| x.palindromic? }
        .max
