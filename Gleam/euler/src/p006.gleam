/// #6 Sum Square Difference - Project Euler
/// http://projecteuler.net/problem=6
import gleam/int
import gleam/io
import gleam/list

pub fn main() {
  let sum_of_sq =
    list.range(1, 100)
    |> list.map(fn(x) { x * x })
    |> list.fold(0, int.add)
  let sq_of_sum = {
    let sum = { 1 + 100 } * 100 / 2
    sum * sum
  }

  io.debug(sq_of_sum - sum_of_sq)
}
