/// #16 Power Digit Sum - Project Euler
/// http://projecteuler.net/problem=16
import gleam/bool.{guard}
import gleam/int
import gleam/list
import gleam/result

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

pub fn digits(n: Int) -> List(Int) {
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

pub fn main() {
  use p2_1000 <- result.try(pow(2, 1000, 1))
  //use digits <- result.map(
  //p2_1000
  //|> digits(),
  //|> result.unwrap([])
  //)

  let dg = digits(p2_1000)

  dg
  |> list.fold(0, int.add)
  |> echo

  Ok(0)
}
