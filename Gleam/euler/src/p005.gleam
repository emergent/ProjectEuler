/// #5 Smallest Multiple - Project Euler
/// http://projecteuler.net/problem=5
import gleam/io
import gleam_community/maths/arithmetics.{lcm}
import gleam/list

pub fn main() {
  list.range(1, 20)
  |> list.fold(1, lcm)
  |> io.debug()
}
