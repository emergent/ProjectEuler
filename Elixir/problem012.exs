# Problem 12 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=12
defmodule P012 do
  defp count_divisors(0), do: 0
  defp count_divisors(x) do
    dmax = trunc(:math.sqrt(x))
    1..dmax
    |> Enum.filter(&(rem(x, &1) == 0))
    |> Enum.map(fn i -> if i * i == x, do: 1, else: 2 end)
    |> Enum.sum
  end

  def solve() do
    Stream.iterate(0, &(&1 + 1))
    |> Stream.map(&(div(&1 * (&1 + 1), 2)))
    |> Stream.map(&({count_divisors(&1), &1}))
    |> Stream.filter(fn x -> {v, _} = x; v > 500 end)
    |> Stream.map(fn x -> {_, ans} = x; ans end)
    |> Enum.at(0)
  end
end

IO.puts P012.solve()
