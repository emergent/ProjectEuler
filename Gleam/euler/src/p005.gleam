/// #5 Smallest Multiple - Project Euler
/// http://projecteuler.net/problem=5
import euler_math.{lcm}
import gleam/int
import gleam/list

pub fn main() {
  int.range(1, 21, [], list.prepend)
  |> list.reverse()
  |> list.fold(1, lcm)
  |> echo
}
