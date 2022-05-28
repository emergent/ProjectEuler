/// Problem 26 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=26
use project_euler::prime::primes;

fn count_cycle(x: u64) -> u64 {
    let mut count = 0;
    let mut n = 1;

    while n % x == n {
        count += 1;
        n *= 10;
    }

    while n % x != 1 {
        if n % x == 0 {
            return 0;
        }
        count += 1;
        n = (n % x) * 10;
    }
    count
}

fn main() {
    let ps: Vec<u64> = primes(1000u64);

    let mut maxcount = 0;
    let mut ans = 0;
    for i in ps {
        let count = count_cycle(i);
        if maxcount < count {
            ans = i;
            maxcount = count;
        }
    }
    println!("{}", ans);
}
