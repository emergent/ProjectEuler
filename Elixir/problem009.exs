# Problem 9 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=9
defmodule P009 do
  def triplet?(x, y) do
    z2 = x * x + y * y
    z = trunc(:math.sqrt(z2))
    if z * z == z2  do
      z
    else
      nil
    end
  end

  def solve() do
    3..1000
    |> Stream.map(
         fn x ->
           x + 1..1000
           |> Stream.filter(&(&1 * &1 + x * x <= 1000000))
           |> Stream.map(
                fn y ->
                  z = triplet?(x, y)
                  if z && (x + y + z == 1000) do
                    x * y * z
                  end
                end
              )
           |> Stream.filter(&(&1))
           |> Enum.at(0)
         end
       )
    |> Stream.filter(&(&1))
    |> Enum.at(0)
  end
end

IO.puts P009.solve()
