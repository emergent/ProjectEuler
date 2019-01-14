#! /usr/bin/env ruby
=begin
Problem 4 - Project Euler
http://projecteuler.net/index.php?section=problems&id=4
=end
class Integer
    def palindromic?
        self.to_s.reverse == self.to_s
    end
end

puts (100..999).to_a
        .combination(2)
        .map {|a| a[0] * a[1]}
        .select {|x| x.palindromic? }
        .max
