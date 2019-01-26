/// Problem 37 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=37
extern crate project_euler;
use project_euler::is_prime;

fn is_truncatable(base: u64) -> bool {
    let mut count = 0;

    // truncate from right
    let mut x = base;
    x = x / 10;
    while x != 0 {
        if !is_prime(x) {
            return false;
        }
        count += 1;
        x = x / 10;
    }

    // truncate from left
    let mut y;
    for i in 1..(count+1) {
        y = base % (10_u64.pow(i));
        if !is_prime(y) {
            return false;
        }
    }
    true
}

fn main() {
    let mut tp = 11;
    let mut tps = Vec::new();
    while tps.len() < 11 {
        if is_prime(tp) && is_truncatable(tp) {
            tps.push(tp);
        }
        tp += 2;
    }
    println!("{:?}", tps);
    println!("{}", tps.iter().fold(0, |sum, x| sum + x));
}

#[test]
fn test_is_truncatable() {
    assert_eq!(is_truncatable(3797) , true);
    assert_eq!(is_truncatable(1001) , false);
}
