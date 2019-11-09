# Problem 16 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=16
defmodule P016 do
  def solve() do
    :math.pow(2, 1000)
    |> round
    |> Integer.digits
    |> Enum.sum
  end
end

IO.puts P016.solve()
