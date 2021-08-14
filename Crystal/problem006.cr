# Problem 6 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=6

puts (1..100).sum ** 2 - (1..100).reduce { |sum, x| sum + x ** 2 }
