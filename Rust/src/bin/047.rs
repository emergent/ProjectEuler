/// Problem 47 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=47
extern crate project_euler;
use project_euler::prime::primes;
use std::collections::HashSet;

const CONSECUTIVE_NUMBERS_LEN: usize = 4;

fn prime_factors(x: u64, ps: &Vec<u64>) -> Vec<u64> {
    let mut v = Vec::new();

    let mut dividend = x;
    for &i in ps {
        while dividend % i == 0 {
            dividend = dividend / i;
            v.push(i);
        }
        if dividend == 1 {
            break;
        }
    }
    v
}

fn main() {
    let primes = primes(500_000);
    let mut consecutives_count = 0;

    for i in 2.. {
        let pf = prime_factors(i, &primes);
        let pf_kinds = pf.iter().collect::<HashSet<_>>().len();

        if pf_kinds == CONSECUTIVE_NUMBERS_LEN {
            consecutives_count += 1;
        } else {
            consecutives_count = 0;
        }

        if consecutives_count == CONSECUTIVE_NUMBERS_LEN {
            println!("{}", i - 3);
            break;
        }
    }
}
