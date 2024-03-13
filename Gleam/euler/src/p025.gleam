/// #25 $1000$-digit Fibonacci Number - Project Euler
/// http://projecteuler.net/problem=25
import gleam/io
import gleam/int
import gleam/list
import gleam/result

type Fibonacci {
  Fibonacci(index: Int, number: Int)
}

fn count_digits(x: Int) -> Int {
  x
  |> int.digits(10)
  |> result.unwrap([])
  |> list.length()
}

fn fib_idx_over(digits: Int, n_2: Fibonacci, n_1: Fibonacci) -> Int {
  let this = Fibonacci(index: n_1.index + 1, number: n_1.number + n_2.number)
  case count_digits(this.number) >= digits {
    True -> this.index
    False -> fib_idx_over(digits, n_1, this)
  }
}

pub fn main() {
  fib_idx_over(1000, Fibonacci(1, 1), Fibonacci(2, 1))
  |> io.debug()
}
