/// Problem 27 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=27

fn is_prime(x: i32) -> bool {
    let xmax = (x as f64).sqrt() as i32 + 1;
    match x {
        2 | 3 | 5 | 7 => true,
        _ if x < 2 || x % 2 == 0 => false,
        _ => {
            for i in (3..xmax).step_by(2) {
                if x % i == 0 { return false; }
            }
            true
        }
    }
}

fn count_primes(a: i32, b: i32) -> i32 {
    let mut n = 0;
    while is_prime(n * n + a * n + b) {
        n += 1;
    }
    n
}

fn main() {
    let mut ans = (0, 0, 0);
    for a in -999..1000 {
        for b in (2..1000).filter(|&i| is_prime(i)) {
            let num_of_primes = count_primes(a, b);
            if ans.2 < num_of_primes {
                ans = (a, b, num_of_primes);
            }
        }
    }
    println!("{}, {}, {}", ans.0, ans.1, ans.2);
    println!("{}", ans.0 * ans.1);
}
