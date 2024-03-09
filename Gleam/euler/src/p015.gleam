/// #15 Lattice Paths - Project Euler
/// http://projecteuler.net/problem=15
import gleam/io
import gleam_community/maths/combinatorics.{combination}

pub fn main() {
  combination(40, 20)
  |> io.debug()
}
