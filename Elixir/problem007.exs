# Problem 7 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=7
defmodule P007 do
  defp sieve([hd | tl], x, ans) do
    if hd * hd > x do
      Enum.reverse(ans) ++ [hd | tl]
    else
      tl
      |> Enum.filter(&(rem(&1, hd) != 0))
      |> sieve(x, [hd | ans])
    end
  end

  def solve(index) do
    x = 100 * index
    2..x
    |> Enum.into([])
    |> sieve(x, [])
    |> Enum.at(index)
  end
end

IO.puts P007.solve(10_000)
