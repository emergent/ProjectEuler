///|
/// Shared helpers and problem implementations for Project Euler.
/// Add each new problem as a `pub fn problem_xxxx()`.
pub fn render_answer(problem_no : Int, answer : String) -> String {
  "Problem " + problem_no.to_string() + ": " + answer
}

///|
/// Problem 1
/// Sum of all the multiples of 3 or 5 below 1000.
pub fn problem_0001() -> Int {
  let mut sum = 0
  for i = 0; i < 1000; i = i + 1 {
    if i % 3 == 0 || i % 5 == 0 {
      sum = sum + i
    }
  }
  sum
}

///|
/// Problem 2
/// Sum of even Fibonacci numbers not exceeding four million.
pub fn problem_0002() -> Int {
  let mut sum = 0
  let mut prev = 1
  let mut curr = 2
  while curr <= 4_000_000 {
    if curr % 2 == 0 {
      sum = sum + curr
    }
    let next = prev + curr
    prev = curr
    curr = next
  }
  sum
}

///|
/// Problem 3
/// Largest prime factor of a composite number.
pub fn problem_0003() -> Int64 {
  let mut n : Int64 = 600_851_475_143
  let mut factor : Int64 = 2
  while factor * factor <= n {
    if n % factor == 0 {
      n = n / factor
    } else {
      factor = factor + 1
    }
  }
  n
}
