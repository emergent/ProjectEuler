/// #14 Longest Collatz Sequence - Project Euler
/// http://projecteuler.net/problem=14
import gleam/io
import gleam/list
import gleam/pair

fn ch(x: Int, i: Int) -> Int {
  case x, x % 2 {
    1, _ -> i
    _, 0 -> ch(x / 2, i + 1)
    _, _ -> ch(x * 3 + 1, i + 1)
  }
}

fn chain(x: Int) -> #(Int, Int) {
  #(x, ch(x, 1))
}

pub fn main() {
  list.range(2, 1_000_000)
  |> list.map(chain)
  |> list.fold(#(1, 1), fn(acc, x) {
    case pair.second(acc) < pair.second(x) {
      True -> x
      False -> acc
    }
  })
  |> pair.first()
  |> io.debug()
}
