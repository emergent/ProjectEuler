/// Problem 2 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=2

fn fibevensum2(a: i32, b: i32, sum: i32, xmax: i32) -> i32 {
    match a {
        a if a >= xmax => sum,
        a if a % 2 == 0 => fibevensum2(b, a + b, sum + a, xmax),
        _ => fibevensum2(b, a + b, sum, xmax),
    }
}

fn fibevensum(xmax: i32) -> i32 {
    fibevensum2(1, 2, 0, xmax)
}

fn main() {
    println!("{}", fibevensum(4000000))
}
