#! /usr/bin/env ruby
=begin
Problem 3 - Project Euler
http://projecteuler.net/index.php?section=problems&id=3
=end

def maxprimefactor x
    divider = 2
    while x != 1
        if x % divider == 0
            x /= divider
        else
            divider += 1
        end
    end
    divider
end

puts maxprimefactor(600851475143)
