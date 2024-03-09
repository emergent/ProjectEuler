/// #12 Highly Divisible Triangular Number - Project Euler
/// http://projecteuler.net/problem=12
import gleam/io
import gleam/bool.{guard}

fn d(i: Int, x: Int, count: Int) -> Int {
  use <- guard(i * i > x, count)
  case x % i, x / i == i {
    0, True -> d(i + 1, x, count + 1)
    0, _ -> d(i + 1, x, count + 2)
    _, _ -> d(i + 1, x, count)
  }
}

fn divisors(x: Int) -> Int {
  d(1, x, 0)
}

fn triangle_div(tn: Int, next: Int, divs: Int) -> Int {
  case divisors(tn) {
    x if x > divs -> tn
    _ -> triangle_div(tn + next, next + 1, divs)
  }
}

pub fn main() {
  io.debug(triangle_div(1, 2, 500))
}
