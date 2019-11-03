# Problem 5 - Project Euler
# http://projecteuler.net/index.php?section=problems&id=5
defmodule P005 do
  def gcd(a, 0), do: a
  def gcd(0, b), do: b
  def gcd(a, b), do: gcd(b, rem(a, b))

  def lcm(0, 0), do: 0
  def lcm(a, b), do: div(a * b, gcd(a, b))

  def solve() do
    1..20
    |> Enum.reduce(10, &lcm/2)
  end
end

IO.puts P005.solve()
