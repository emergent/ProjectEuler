/// Problem 25 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=25
extern crate num;
use num::bigint::{BigInt, ToBigInt};

fn fibodigits(max_digits: i32) -> i32 {
    let mut a: BigInt = 1.to_bigint().unwrap();
    let mut b: BigInt = 1.to_bigint().unwrap();
    let mut digits;
    let mut idx = 1;

    for i in 2 .. {
        digits = b.to_string().chars().count() as i32;
        if digits >= max_digits {
            idx = i;
            break;
        }

        let tmp = a;
        a = b.clone();
        b = b + tmp;
    }
    idx
}

fn main() {
    println!("{:?}", fibodigits(1000));
}
