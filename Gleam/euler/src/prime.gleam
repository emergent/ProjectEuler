import gleam/list
import gleam/bool.{guard}

pub fn primes(max: Int) -> List(Int) {
  use <- guard(max < 2, [])
  sieve(list.range(2, max), max, [])
}

fn sieve(xs: List(Int), max: Int, ans: List(Int)) -> List(Int) {
  case xs {
    [] -> []
    [head, ..tail] -> {
      use <- guard(
        when: head * head > max,
        return: list.concat([list.reverse(ans), [head, ..tail]]),
      )

      tail
      |> list.filter(fn(x) { x % head != 0 })
      |> sieve(max, [head, ..ans])
    }
  }
}
