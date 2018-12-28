/// Problem 5 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=5

fn gcd(x: i32, y: i32) -> i32 {
    if x == 0 { y } else { gcd(y % x, x) }
}

fn lcm(x: i32, y: i32) -> i32 {
    x * y / gcd(x, y)
}

fn main() {
    println!("{}",(1..20).fold(1, lcm))
}
