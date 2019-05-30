/// Problem 35 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=35
extern crate project_euler;
use project_euler::prime::{is_prime, primes};
use std::collections::HashSet;

fn rotate1(x: u32) -> u32 {
    if x / 10 == 0 {
        return x;
    }

    let mut xs = x.to_string().chars().collect::<Vec<char>>();

    let top = xs.remove(0);
    xs.push(top);
    xs.iter().collect::<String>().parse::<u32>().unwrap_or(0)
}

fn rotate(x: u32, n: u32) -> u32 {
    if n == 0 {
        return x;
    }

    let mut ans = x;
    for _ in 1..n + 1 {
        ans = rotate1(ans);
    }
    ans
}

fn main() {
    let ps = primes(1_000_000);
    let mut hs = HashSet::new();
    for p in ps {
        if p.to_string().chars().any(|c| c == '0') {
            continue;
        }

        let digits_count = p.to_string().chars().count() as u32;
        if (0..digits_count).map(|i| rotate(p, i)).all(|x| is_prime(x)) {
            hs.insert(p);
        }
    }
    println!("{}", hs.len());
}

#[test]
fn test_rotate1() {
    assert_eq!(rotate1(2), 2);
    assert_eq!(rotate1(3), 3);
    assert_eq!(rotate1(5), 5);
    assert_eq!(rotate1(7), 7);
    assert_eq!(rotate1(11), 11);
    assert_eq!(rotate1(13), 31);
    assert_eq!(rotate1(13432), 34321);
    assert_eq!(rotate1(10), 1);
    assert_eq!(rotate1(10000), 1);
}

#[test]
fn test_rotate() {
    assert_eq!(rotate(2, 1), 2);
    assert_eq!(rotate(3, 1), 3);
    assert_eq!(rotate(5, 1), 5);
    assert_eq!(rotate(7, 1), 7);
}
