import gleam/bool.{guard}
import gleam/int
import gleam/list

pub fn primes(max: Int) -> List(Int) {
  use <- guard(max < 2, [])
  sieve(int.range(2, max, [], list.prepend) |> list.reverse(), max, [])
}

fn sieve(xs: List(Int), max: Int, ans: List(Int)) -> List(Int) {
  case xs {
    [] -> []
    [head, ..tail] -> {
      use <- guard(
        when: head * head > max,
        return: list.flatten([list.reverse(ans), [head, ..tail]]),
      )

      tail
      |> list.filter(fn(x) { x % head != 0 })
      |> sieve(max, [head, ..ans])
    }
  }
}
