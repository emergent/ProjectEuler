#! /usr/bin/env ruby
# Problem 47 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=47
require 'prime'
i = 647
count = 0
loop do
  if i.prime_division.size >= 4
    count += 1
    break if count == 4
  else
    count = 0
  end
  i += 1
end

puts i - 3
