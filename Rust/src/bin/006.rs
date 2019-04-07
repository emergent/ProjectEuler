/// Problem 6 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=6
fn main() {
    let limit = 100;
    let sumsq: i32 = ((1 + limit) * limit / 2 as i32).pow(2);
    let sqsum: i32 = (1..=limit).map(|i| i * i).sum();
    println!("{}", sumsq - sqsum);
}
