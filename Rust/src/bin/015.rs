/// Problem 15 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=15
fn comb(n: i64, k: i64) -> i64 {
    match k {
        1 => n,
        _ => comb(n, k - 1) * (n - k + 1) / k,
    }
}

fn main() {
    println!("{}", comb(40, 20));
}
