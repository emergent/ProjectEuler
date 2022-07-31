/// Problem 63 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=63
fn main() {
    // n - 1 <= log10 k^n < n
    // -> log10 k < 1 && n <= 1 / log10 (10/k)
    let mut count = 0;
    for i in 1..10 {
        let k = i as f64;
        let n = (1.0 / (10.0 / k).log10()).floor() as i32;
        count += n
    }
    println!("{}", count);
}
