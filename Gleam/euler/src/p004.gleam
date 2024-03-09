/// #4 Largest Palindrome Product - Project Euler
/// http://projecteuler.net/problem=4
import gleam/io
import gleam/int.{max, to_string}
import gleam/string.{reverse}
import gleam/list

fn is_palindromic(x: Int) -> Bool {
  let s = to_string(x)
  s == reverse(s)
}

pub fn main() {
  list.range(100, 999)
  |> list.map(fn(x) { list.map(list.range(100, x), fn(y) { x * y }) })
  |> list.flatten()
  //|> list.unique() // ???
  |> list.filter(is_palindromic)
  |> list.fold(0, max)
  |> io.debug()
}
