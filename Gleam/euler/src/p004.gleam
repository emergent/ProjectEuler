/// #4 Largest Palindrome Product - Project Euler
/// http://projecteuler.net/problem=4
import gleam/int.{max, to_string}
import gleam/list
import gleam/string.{reverse}

fn is_palindromic(x: Int) -> Bool {
  let s = to_string(x)
  s == reverse(s)
}

pub fn main() {
  int.range(100, 1000, [], list.prepend)
  |> list.reverse()
  |> list.flat_map(fn(x) {
    list.map(int.range(100, x, [], list.prepend), fn(y) { x * y })
  })
  //|> list.unique() // ???
  |> list.filter(is_palindromic)
  |> list.fold(0, max)
  |> echo
}
