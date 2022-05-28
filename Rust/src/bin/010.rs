/// Problem 10 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=10
use project_euler::prime::primes;

fn main() {
    let ans = primes(2_000_000).iter().fold(0, |sum, &x| sum + x as u64);
    println!("{}", ans);
}
