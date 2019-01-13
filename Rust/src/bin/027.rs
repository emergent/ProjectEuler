/// Problem 27 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=27
extern crate project_euler;
use project_euler::is_prime_i32;

fn count_primes(a: i32, b: i32) -> i32 {
    let mut n = 0;
    while is_prime_i32(n * n + a * n + b) {
        n += 1;
    }
    n
}

fn main() {
    let mut ans = (0, 0, 0);
    for a in -999..1000 {
        for b in (2..1000).filter(|&i| is_prime_i32(i)) {
            let num_of_primes = count_primes(a, b);
            if ans.2 < num_of_primes {
                ans = (a, b, num_of_primes);
            }
        }
    }
    println!("{}, {}, {}", ans.0, ans.1, ans.2);
    println!("{}", ans.0 * ans.1);
}
