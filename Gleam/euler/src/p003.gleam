/// Problem 3 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=3
import gleam/io
import gleam/bool.{guard}

fn maxprimefactor(x: Int, div: Int, ans: Int) -> Int {
  use <- guard(x <= 1, ans)

  case x % div {
    0 -> maxprimefactor(x / div, div, div)
    _ -> maxprimefactor(x, div + 1, ans)
  }
}

pub fn main() {
  io.debug(maxprimefactor(600_851_475_143, 2, 0))
}
