pub fn factorial(n: Int) -> Result(Int, Nil) {
  case n < 0 {
    True -> Error(Nil)
    False -> Ok(factorial_loop(n, 1))
  }
}

fn factorial_loop(n: Int, acc: Int) -> Int {
  case n <= 1 {
    True -> acc
    False -> factorial_loop(n - 1, acc * n)
  }
}

pub fn combination(n: Int, k: Int) -> Int {
  case k < 0 || k > n {
    True -> 0
    False -> {
      let k = min(k, n - k)
      combination_loop(n, k, 1, 1)
    }
  }
}

fn combination_loop(n: Int, k: Int, i: Int, acc: Int) -> Int {
  case i > k {
    True -> acc
    False -> combination_loop(n, k, i + 1, acc * { n - k + i } / i)
  }
}

pub fn gcd(a: Int, b: Int) -> Int {
  case b == 0 {
    True -> abs(a)
    False -> gcd(b, a % b)
  }
}

pub fn lcm(a: Int, b: Int) -> Int {
  case a == 0 || b == 0 {
    True -> 0
    False -> abs(a / gcd(a, b) * b)
  }
}

fn min(a: Int, b: Int) -> Int {
  case a <= b {
    True -> a
    False -> b
  }
}

fn abs(x: Int) -> Int {
  case x < 0 {
    True -> 0 - x
    False -> x
  }
}
