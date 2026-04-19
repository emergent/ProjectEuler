/// #7 10001st Prime - Project Euler
/// http://projecteuler.net/problem=7
import gleam/list
import prime

pub fn main() {
  prime.primes(1_000_000)
  |> list.drop(10_001 - 1)
  |> list.first()
  |> echo
}
