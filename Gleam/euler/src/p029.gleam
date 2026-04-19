/// #29 Distinct Powers - Project Euler
/// http://projecteuler.net/problem=29
import gleam/io
import gleam/iterator
import gleam/list

pub fn main() {
  list.range(2, 100)
  |> list.flat_map(fn(x) {
    iterator.iterate(x * x, fn(n) { n * x })
    |> iterator.take(100 - 2 + 1)
    |> iterator.to_list()
  })
  |> list.unique()
  |> list.length()
  |> io.debug()
}
