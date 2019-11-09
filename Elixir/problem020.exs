# Problem 20 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=20
defmodule P020 do
  def solve() do
    1..100
    |> Enum.reduce(1, &(&1 * &2))
    |> Integer.digits
    |> Enum.sum
  end
end

IO.puts P020.solve()
