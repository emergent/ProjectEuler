/// Problem 2 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=2
import gleam/io
import gleam/bool.{guard}

fn fibevensum2(a: Int, b: Int, sum: Int, xmax: Int) -> Int {
  use <- guard(a >= xmax, sum)
  use <- guard(a % 2 != 0, fibevensum2(b, a + b, sum, xmax))
  fibevensum2(b, a + b, sum + a, xmax)
}

fn fibevensum(xmax: Int) -> Int {
  fibevensum2(1, 2, 0, xmax)
}

pub fn main() {
  io.debug(fibevensum(4_000_000))
}
