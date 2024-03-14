/// #23 Non-Abundant Sums - Project Euler
/// http://projecteuler.net/problem=23
import gleam/io
import gleam/list
import gleam/int
import gleam/set
import gleam/bool.{guard}

fn fsum(x: Int, i: Int, ans: Int) -> Int {
  use <- guard(i * i > x, return: ans)

  let a = case x % i, x / i {
    0, j if j == i -> ans + i
    0, j -> ans + i + j
    _, _ -> ans
  }

  fsum(x, i + 1, a)
}

fn factors_sum(x: Int) -> Int {
  fsum(x, 1, 0)
}

fn is_abundant(x: Int) -> Bool {
  x < factors_sum(x) - x
}

const upper = 28_123

pub fn main() {
  let abundants =
    list.range(1, upper)
    |> list.filter(fn(x) { is_abundant(x) })
  let sum = { 1 + upper } * upper / 2

  let sum_of_abundants =
    abundants
    |> list.flat_map(fn(x) {
      abundants
      |> list.map(fn(y) { x + y })
      |> list.filter(fn(x) { x <= upper })
    })
    |> set.from_list()
    |> set.fold(0, int.add)

  io.debug(sum - sum_of_abundants)
}
