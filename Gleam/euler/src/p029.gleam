/// #29 Distinct Powers - Project Euler
/// http://projecteuler.net/problem=29
import gleam/int
import gleam/list

fn int_power(base: Int, exponent: Int, acc: Int) -> Int {
  case exponent <= 0 {
    True -> acc
    False -> int_power(base, exponent - 1, acc * base)
  }
}

fn powers(
  base: Int,
  exponent: Int,
  max_exponent: Int,
  acc: List(Int),
) -> List(Int) {
  case exponent > max_exponent {
    True -> list.reverse(acc)
    False ->
      powers(base, exponent + 1, max_exponent, [
        int_power(base, exponent, 1),
        ..acc
      ])
  }
}

pub fn main() {
  int.range(2, 100 + 1, [], list.prepend)
  |> list.reverse()
  |> list.flat_map(fn(x) { powers(x, 2, 100, []) })
  |> list.unique()
  |> list.length()
  |> echo
}
