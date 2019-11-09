# Problem 15 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=15
defmodule P015 do
  def solve() do
    div(
      21..40
      |> Enum.reduce(&(&1 * &2)),
      1..20
      |> Enum.reduce(&(&1 * &2))
    )
  end
end

IO.puts P015.solve()
