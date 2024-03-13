/// #25 $1000$-digit Fibonacci Number - Project Euler
/// http://projecteuler.net/problem=25
import gleam/io
import gleam/int
import gleam/list
import gleam/result

fn count_digits(x: Int) -> Int {
  x
  |> int.digits(10)
  |> result.unwrap([])
  |> list.length()
}

fn fib_idx_over(digits: Int, idx: Int, n_1: Int, n_2: Int) -> Int {
  case count_digits(n_1 + n_2) >= digits {
    True -> idx
    False -> fib_idx_over(digits, idx + 1, n_1 + n_2, n_1)
  }
}

pub fn main() {
  fib_idx_over(1000, 3, 1, 1)
  |> io.debug()
}
