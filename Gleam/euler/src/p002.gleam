/// Problem 2 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=2
import gleam/io

fn fibevensum2(a: Int, b: Int, sum: Int, xmax: Int) -> Int {
  case a >= xmax, a % 2 == 0 {
    True, _ -> sum
    _, True -> fibevensum2(b, a + b, sum + a, xmax)
    _, _ -> fibevensum2(b, a + b, sum, xmax)
  }
}

fn fibevensum(xmax: Int) -> Int {
  fibevensum2(1, 2, 0, xmax)
}

pub fn main() {
  io.debug(fibevensum(4_000_000))
}
