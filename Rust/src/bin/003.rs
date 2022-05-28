/// Problem 3 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=3
use std::cmp::max;

fn maxprimefactor(mut x: i64) -> i64 {
    let mut ans = 1;
    for i in 2.. {
        if i >= x {
            break;
        }
        while x % i == 0 {
            ans = max(ans, i);
            x /= i;
        }
    }
    ans = max(ans, x);
    ans
}

fn main() {
    println!("{}", maxprimefactor(600851475143))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_maxprimefactor() {
        assert_eq!(maxprimefactor(2), 2);
        assert_eq!(maxprimefactor(3), 3);
        assert_eq!(maxprimefactor(10), 5);
        assert_eq!(maxprimefactor(16), 2);
    }
}
