# Problem 4 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=4
defmodule P004 do
  def palindromic?(x) do
    rev = x
          |> Integer.to_string
          |> String.reverse
          |> String.to_integer
    x == rev
  end

  def solve(x) do
    100..x
    |> Stream.flat_map(
         fn i ->
           i..x
           |> Stream.map(&(&1 * i))
         end
       )
    |> Stream.uniq
    |> Stream.filter(&palindromic?/1)
    |> Enum.max
  end
end

IO.puts P004.solve(999)
