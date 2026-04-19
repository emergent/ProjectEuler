/// Problem 1 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=1
fn summul1(n: Int, x: Int) -> Int {
  { x * { n / x } * { n / x + 1 } } / 2
}

fn summul2(n: Int, x: Int, y: Int) -> Int {
  summul1(n, x) + summul1(n, y) - summul1(n, x * y)
}

pub fn main() {
  echo summul2(999, 3, 5)
}
