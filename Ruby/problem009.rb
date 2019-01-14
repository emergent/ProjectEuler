#! /usr/bin/env ruby
=begin
Problem 9 - Project Euler
http://projecteuler.net/index.php?section=problems&id=9
=end
(5..1000).each {|c|
    (4..c).each {|b|
        (3..b).each {|a|
            if a*a + b*b == c*c && 1000 % (a+b+c) == 0
                puts a*b*c*(1000.quo(a+b+c).to_i).pow(3)
                return
            end
        }
    }
}
