# Problem 4 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=4

def palindromic?(x)
  x == x.to_s.reverse.to_i
end

ans = (100...1000).map { |i|
  (i...1000).map { |j| i * j }
}.flatten.select { |x| palindromic?(x) }.max

puts ans
