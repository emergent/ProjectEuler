/// Problem 50 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=50
extern crate project_euler;
use project_euler::prime::{primes, is_prime};

fn main() {
    let ps = primes(100_000);
    let len = ps.len();

    'outer: for i in (0..len).rev() {
        for j in (0..len-i).rev() {
            let sum = ps[j..j+i].iter().sum::<u32>();
            //if sum < 1000_000 && ps.contains(&sum) {
            if sum < 1000_000 && is_prime(sum.into()) {
                println!("{}, {}, {}", i, j, sum);
                break 'outer
            }
        }
    }
}
