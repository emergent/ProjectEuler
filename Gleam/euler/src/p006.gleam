/// #6 Sum Square Difference - Project Euler
/// http://projecteuler.net/problem=6
import gleam/int
import gleam/list

pub fn main() {
  let sum_of_sq =
    int.range(1, 101, [], list.prepend)
    |> list.reverse()
    |> list.map(fn(x) { x * x })
    |> list.fold(0, int.add)
  let sq_of_sum = {
    let sum = { 1 + 100 } * 100 / 2
    sum * sum
  }

  echo sq_of_sum - sum_of_sq
}
