# Problem 6 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=6
defmodule P006 do
  def solve() do
    a = 1..100
        |> Enum.reduce(fn (x, acc) -> x * x + acc end)
    b = 1..100
        |> Enum.reduce(&+/2)
    (b * b) - a
  end
end

IO.puts P006.solve()
