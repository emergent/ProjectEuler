# Problem 2 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=2
defmodule P002 do
  def fibevensum(fmax, a, b, ans) do
    next = a + b
    if next >= fmax do
      ans
    else
      if rem(next, 2) == 0 do
        fibevensum(fmax, b, next, ans + next)
      else
        fibevensum(fmax, b, next, ans)
      end
    end
  end

  def solve(fmax) do
    fibevensum(fmax, 1, 2, 2)
  end
end

IO.puts P002.solve(4000000)
