/// #10 Summation of Primes - Project Euler
/// http://projecteuler.net/problem=10
import gleam/int
import gleam/list
import prime

pub fn main() {
  prime.primes(2_000_000)
  |> list.fold(0, int.add)
  |> echo
}
