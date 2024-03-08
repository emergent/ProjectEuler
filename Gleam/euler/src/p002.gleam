/// Problem 2 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=2
import gleam/io
import gleam/int

fn fibevensum2(a: Int, b: Int, sum: Int, xmax: Int) -> Int {
  case a >= xmax {
    True -> sum
    False ->
      case int.is_even(a) {
        True -> fibevensum2(b, a + b, sum + a, xmax)
        False -> fibevensum2(b, a + b, sum, xmax)
      }
  }
}

fn fibevensum(xmax: Int) -> Int {
  fibevensum2(1, 2, 0, xmax)
}

pub fn main() {
  io.debug(fibevensum(4_000_000))
}
