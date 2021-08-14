#! /usr/bin/env ruby
# Problem 14 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=14

class Collaz
  def initialize
    @cache = Hash(Int64, Int64).new
  end

  def chain(n : Int64) : Int64
    if @cache[n]?
      return @cache[n]
    elsif n == 1
      return 1_i64
    end

    c = if n.even?
          1_i64 + self.chain(n // 2_i64)
        else
          1_i64 + self.chain(3_i64 * n + 1_i64)
        end
    @cache[n] = c
    c
  end
end

collaz = Collaz.new
maxlen = 0
maxval = 0
(1_i64..1_000_000_i64).each do |i|
  c = collaz.chain i
  if c > maxlen
    maxlen = c
    maxval = i
  end
end
puts maxval
