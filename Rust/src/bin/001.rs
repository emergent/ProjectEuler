/// Problem 1 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=1
fn summul1(n: i32, x: i32) -> i32 {
    (x * (n / x) * (n / x + 1)) / 2
}

fn summul2(n: i32, x: i32, y: i32) -> i32 {
    summul1(n, x) + summul1(n, y) - summul1(n, x * y)
}

fn main() {
    println!("{}", summul2(999, 3, 5))
}
