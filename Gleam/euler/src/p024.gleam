/// #24 Lexicographic Permutations - Project Euler
/// http://projecteuler.net/problem=24
import gleam/io
import gleam/int
import gleam/list
import gleam/string
import gleam/result

pub fn main() {
  use ans <- result.map(
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    |> list.permutations()
    |> list.at(1_000_000 - 1),
  )

  ans
  |> list.map(int.to_string)
  |> string.join("")
  |> io.println()
}
