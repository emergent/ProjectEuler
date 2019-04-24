#! /usr/bin/env ruby
=begin
Problem 32 - Project Euler
http://projecteuler.net/index.php?section=problems&id=32
=end
def pandigital_product(cs)
    product = cs[5, cs.size].join.to_i
    pp =
        (1..3).map {|i|
            cs[0, i].join.to_i * cs[i, 5-i].join.to_i
        }.select { |m| m == product }
        .to_a
    return pp.empty? ? nil : product
end

puts '123456789'.chars
                .permutation
                .map {|p| pandigital_product(p)}
                .compact
                .uniq
                .sum
