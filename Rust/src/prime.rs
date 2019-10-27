extern crate num;

use self::num::{Integer, NumCast};

pub fn is_prime<N>(x: N) -> bool
where
    N: Integer + NumCast + Copy,
{
    let two: N = NumCast::from(2).unwrap();
    let three: N = NumCast::from(3).unwrap();
    match x {
        x if x == two => true,
        x if x < two || x % two == N::zero() => false,
        _ => {
            let mut i = three;
            while i * i <= x {
                if x % i == N::zero() {
                    return false;
                }
                i = i + two;
            }
            true
        }
    }
}

pub fn primes(x: u32) -> Vec<u32> {
    let x_ = x as usize;
    let mut ps = vec![];
    let mut is_prime = vec![true; x_ + 1];

    if x >= 2 {
        for i in 2..x_ + 1 {
            if is_prime[i] {
                ps.push(i as u32);
            }
            if i * i <= x_ {
                for j in 2..(x_ / i) + 1 {
                    is_prime[i * j] = false;
                }
            }
        }
    }
    ps
}

#[test]
fn test_is_prime() {
    assert_eq!(is_prime(0), false);
    assert_eq!(is_prime(1), false);
    assert_eq!(is_prime(4), false);

    assert_eq!(is_prime(2), true);
    assert_eq!(is_prime(3), true);
    assert_eq!(is_prime(5), true);
    assert_eq!(is_prime(7), true);
    assert_eq!(is_prime(11), true);
    assert_eq!(is_prime(11 as i8), true);
    assert_eq!(is_prime(11 as i16), true);
    assert_eq!(is_prime(11 as i32), true);
    assert_eq!(is_prime(11 as i64), true);
    assert_eq!(is_prime(11 as i128), true);
    assert_eq!(is_prime(11 as u8), true);
    assert_eq!(is_prime(11 as u16), true);
    assert_eq!(is_prime(11 as u32), true);
    assert_eq!(is_prime(11 as u64), true);
    assert_eq!(is_prime(11 as u128), true);
    assert_eq!(is_prime(20190523 as u64), true);
    assert_eq!(is_prime(20190523), true);
}

#[test]
fn test_primes() {
    assert_eq!(primes(1), []);
    assert_eq!(primes(2), [2]);
    assert_eq!(primes(3), [2, 3]);
    assert_eq!(primes(4), [2, 3]);
    assert_eq!(primes(5), [2, 3, 5]);
    assert_eq!(
        primes(100),
        [
            2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83,
            89, 97
        ]
    )
}
