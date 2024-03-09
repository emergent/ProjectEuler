import gleam/list

pub fn primes(max: Int) -> List(Int) {
  case max >= 2 {
    True -> {
      let xs = list.range(2, max)
      sieve(xs, max, [])
    }
    False -> []
  }
}

fn sieve(xs: List(Int), max: Int, ans: List(Int)) -> List(Int) {
  case xs {
    [head, ..tail] ->
      case head * head > max {
        True -> list.concat([list.reverse(ans), [head, ..tail]])
        False ->
          tail
          |> list.filter(fn(x) { x % head != 0 })
          |> sieve(max, [head, ..ans])
      }
    [] -> []
  }
}
