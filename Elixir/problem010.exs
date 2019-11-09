# Problem 10 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=10
defmodule P010 do
  defp sieve([hd | tl], x, ans) do
    if hd * hd > x do
      Enum.reverse(ans) ++ [hd | tl]
    else
      tl
      |> Enum.filter(&(rem(&1, hd) != 0))
      |> sieve(x, [hd | ans])
    end
  end

  def solve() do
    x = 2_000_000
    2..x - 1
    |> Enum.into([])
    |> sieve(x, [])
    |> Enum.sum
  end
end

IO.puts P010.solve()
