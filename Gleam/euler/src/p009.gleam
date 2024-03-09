/// #9 Special Pythagorean Triplet - Project Euler
/// http://projecteuler.net/problem=9
import gleam/io
import gleam/list

const sum_abc = 1000

fn to_abc_if_is_pythagorean(a: Int, b: Int, c: Int) -> Result(Int, Nil) {
  case a * a + b * b == c * c {
    True -> Ok(a * b * c)
    False -> Error(Nil)
  }
}

pub fn main() {
  list.range(1, sum_abc - 2)
  |> list.flat_map(fn(x) {
    list.range(x, sum_abc - 1)
    |> list.filter_map(fn(y) { to_abc_if_is_pythagorean(x, y, sum_abc - x - y) })
    |> io.debug()
  })
  |> list.first()
  |> io.debug()
}
