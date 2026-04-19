/// #25 $1000$-digit Fibonacci Number - Project Euler
/// http://projecteuler.net/problem=25
import gleam/int
import gleam/list

type Fibonacci {
  Fibonacci(index: Int, number: Int)
}

fn digits(n: Int) -> List(Int) {
  n
  |> int.absolute_value()
  |> digits_loop([])
  |> list.reverse
}

fn digits_loop(n: Int, acc: List(Int)) -> List(Int) {
  case n < 10 {
    True -> [n, ..acc]
    False -> digits_loop(n / 10, [n % 10, ..acc])
  }
}

fn count_digits(x: Int) -> Int {
  x
  |> digits()
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
  |> echo
}
