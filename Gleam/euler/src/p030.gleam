/// #30 Digit Fifth Powers - Project Euler
/// http://projecteuler.net/problem=30
import euler_math.{digits}
import gleam/int
import gleam/list

fn fifth(x: Int) -> Int {
  let ds = digits(x)
  ds
  |> list.fold(0, fn(acc, x) { acc + x * x * x * x * x })
}

pub fn main() {
  int.range(2, 354_295, [], list.prepend)
  |> list.reverse()
  |> list.filter(fn(x) { fifth(x) == x })
  |> list.fold(0, int.add)
  |> echo
}
