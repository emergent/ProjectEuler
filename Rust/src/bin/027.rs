/// Problem 27 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=27
use project_euler::prime::is_prime;

fn count_primes(a: i64, b: i64) -> i64 {
    let mut n = 0;
    let mut y = b;
    while y > 0 && is_prime(y as u64) {
        n += 1;
        y = n * n + a * n + b;
    }
    n
}

fn main() {
    let mut ans = (0, 0, 0);
    for a in -999..1000 {
        for b in (2..1000).filter(|&i| is_prime(i as u64)) {
            let num_of_primes = count_primes(a, b);
            if ans.2 < num_of_primes {
                ans = (a, b, num_of_primes);
            }
        }
    }
    println!("{}, {}, {}", ans.0, ans.1, ans.2);
    println!("{}", ans.0 * ans.1);
}
