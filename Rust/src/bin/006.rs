/// Problem 6 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=6
fn main() {
    let limit: i32 = 100;
    let sumsq = ((1 + limit) * limit / 2).pow(2);
    let sqsum = (1..=limit).map(|i| i * i).sum::<i32>();
    println!("{}", sumsq - sqsum);
}
