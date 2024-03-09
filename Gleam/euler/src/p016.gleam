/// #16 Power Digit Sum - Project Euler
/// http://projecteuler.net/problem=16
import gleam/io
import gleam/int
import gleam/list
import gleam/result
import gleam/bool.{guard}

fn pow(base: Int, n: Int, ans: Int) -> Result(Int, Nil) {
  use <- guard(base < 0, Error(Nil))
  use <- guard(n < 0, Error(Nil))
  use <- guard(n == 0, Ok(1))
  use <- guard(n == 1, Ok(base * ans))

  case n % 2 {
    0 -> pow(base * base, n / 2, ans)
    _ -> pow(base * base, { n - 1 } / 2, ans * base)
  }
}

pub fn main() {
  use p2_1000 <- result.try(pow(2, 1000, 1))
  use digits <- result.map(
    p2_1000
    |> int.digits(10)
    |> result.nil_error(),
  )

  digits
  |> list.fold(0, int.add)
  |> io.debug()
}
