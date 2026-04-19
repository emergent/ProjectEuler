/// #20 Factorial Digit Sum - Project Euler
/// http://projecteuler.net/problem=20
import euler_math.{factorial}
import gleam/int
import gleam/io
import gleam/list

pub fn main() {
  let assert Ok(f) = factorial(100)
  let assert Ok(digits) = int.digits(f, 10)

  digits
  |> list.fold(0, int.add)
  |> io.debug()
}
