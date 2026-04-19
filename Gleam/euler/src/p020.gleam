/// #20 Factorial Digit Sum - Project Euler
/// http://projecteuler.net/problem=20
import euler_math.{digits, factorial}
import gleam/int
import gleam/list

pub fn main() {
  let assert Ok(f) = factorial(100)
  let digits = digits(f)

  digits
  |> list.fold(0, int.add)
  |> echo
}
