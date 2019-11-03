# Problem 1 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=1
defmodule P001 do
  def summul(n, x) do
    div(x * div(n, x) * (div(n, x) + 1), 2)
  end

  def solve(n, x, y) do
    summul(n, x) + summul(n, y) - summul(n, x * y)
  end
end

IO.puts P001.solve(999, 3, 5)
