/// #30 Digit Fifth Powers - Project Euler
/// http://projecteuler.net/problem=30
import gleam/io
import gleam/int
import gleam/list

fn fifth(x: Int) -> Int {
  let assert Ok(ds) = int.digits(x, 10)
  ds
  |> list.fold(0, fn(acc, x) { acc + x * x * x * x * x })
}

pub fn main() {
  list.range(2, 354_294)
  |> list.filter(fn(x) { fifth(x) == x })
  |> list.fold(0, int.add)
  |> io.debug()
}
