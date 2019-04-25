#! /usr/bin/env ruby
=begin
Problem 44 - Project Euler
http://projecteuler.net/index.php?section=problems&id=44
=end
class Integer
    def penta?
        d = 1 + 24 * self
        d_sq = Math.sqrt(d).to_i
        d_sq * d_sq == d && (d_sq + 1) % 6 == 0
    end

    def penta
        self * (3 * self - 1) / 2
    end
end

puts (2..).lazy
        .flat_map {|k|
            (1..k).map {|j|
                pk, pj = k.penta, j.penta
                [(pk - pj), (pk + pj)]
            }
        }
        .select {|p1, p2| p1.penta? && p2.penta? }
        .first[0]
