/// #21 Amicable Numbers - Project Euler
/// http://projecteuler.net/problem=21
import gleam/io
import gleam/list
import gleam/int
import gleam/pair
import gleam/set.{type Set}
import gleam/bool.{guard}

fn f(x: Int, i: Int, ans: Set(Int)) -> Set(Int) {
  use <- guard(i * i > x, return: ans)

  let a = case x % i {
    0 ->
      ans
      |> set.insert(i)
      |> set.insert(x / i)
    _ -> ans
  }

  f(x, i + 1, a)
}

fn factors(x: Int) -> Set(Int) {
  let s = set.new()
  f(x, 1, s)
}

fn d(x: Int) -> Int {
  let fs = factors(x)
  fs
  |> set.fold(0, int.add)
  |> int.subtract(x)
}

fn get_amicable_pair(x: Int) -> Result(#(Int, Int), Nil) {
  use <- guard(x == 1, return: Error(Nil))

  let dx = d(x)
  case x < 10_000 && x != dx && x == d(dx) {
    True -> Ok(#(x, dx))
    False -> Error(Nil)
  }
}

pub fn main() {
  list.range(1, 10_000)
  |> list.filter_map(fn(i) { get_amicable_pair(i) })
  |> list.flat_map(fn(p) { [pair.first(p), pair.second(p)] })
  |> list.unique()
  |> list.fold(0, int.add)
  |> io.debug()
}
