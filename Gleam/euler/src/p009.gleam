/// #9 Special Pythagorean Triplet - Project Euler
/// http://projecteuler.net/problem=9
import gleam/bool
import gleam/int
import gleam/list
import gleam/result

const sum_abc = 1000

fn to_abc_if_is_pythagorean(a: Int, b: Int, c: Int) -> Result(Int, Nil) {
  use <- bool.guard(when: a * a + b * b != c * c, return: Error(Nil))
  Ok(a * b * c)
}

pub fn main() {
  use ans <- result.try(
    int.range(1, sum_abc - 2 + 1, [], list.prepend)
    |> list.reverse()
    |> list.flat_map(fn(x) {
      int.range(x, sum_abc - 1, [], list.prepend)
      |> list.reverse()
      |> list.filter_map(fn(y) {
        to_abc_if_is_pythagorean(x, y, sum_abc - x - y)
      })
    })
    |> list.first(),
  )

  echo ans
  Ok(ans)
}
