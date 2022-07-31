/// Problem 37 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=37
use project_euler::prime::is_prime;

fn is_truncatable(x: u64) -> bool {
    let mut xr = x / 10;
    let mut d = 10;
    let mut xl;
    while xr > 0 {
        xl = x % d;
        if !(is_prime(xr) && is_prime(xl)) {
            return false;
        }
        xr /= 10;
        d *= 10;
    }
    is_prime(x)
}

fn main() {
    let mut tp = 11;
    let mut tps = Vec::new();
    while tps.len() < 11 {
        if is_truncatable(tp) {
            tps.push(tp);
        }
        tp += 2;
    }
    println!("{:?}", tps);
    println!("{}", tps.iter().sum::<u64>());
}

#[test]
fn test_is_truncatable() {
    assert_eq!(is_truncatable(3797), true);
    assert_eq!(is_truncatable(1001), false);
}
