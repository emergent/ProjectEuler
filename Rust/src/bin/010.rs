/// Problem 10 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=10
extern crate project_euler;
use project_euler::primes;

fn main() {
    let ans: u64 = primes(2_000_000).iter().fold(0, |sum, &x| sum + x as u64);
    println!("{}", primes(2_000_000).last().unwrap());
    println!("{}", ans);
}
