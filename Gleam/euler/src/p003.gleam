/// Problem 3 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=3
import gleam/io

fn maxprimefactor(x: Int, div: Int, ans: Int) -> Int {
  case x <= 1, x % div == 0 {
    True, _ -> ans
    _, True -> maxprimefactor(x / div, div, div)
    _, _ -> maxprimefactor(x, div + 1, ans)
  }
}

pub fn main() {
  io.debug(maxprimefactor(600_851_475_143, 2, 0))
}
