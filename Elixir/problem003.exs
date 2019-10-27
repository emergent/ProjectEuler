#! /usr/bin/env ruby
# Problem 3 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=3
defmodule P003 do
  defp maxp(x, d) do
    if d * d > x do
      x
    else
      if rem(x, d) == 0 do
        maxp(div(x, d), d)
      else
        maxp(x, d + 1)
      end
    end
  end

  def solve(x) do
    maxp(x, 2)
  end
end

IO.puts P003.solve(600851475143)
