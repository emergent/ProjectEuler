# #20 Factorial digit sum - Project Euler
# http://projecteuler.net/index.php?section=problems&id=20

require "big"
puts (1..100).reduce(BigInt.new(1)) { |acc, x| acc * x }.to_s.chars.map { |c| c.to_i }.sum
