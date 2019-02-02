/// Problem 20 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=20
extern crate num;
use num::bigint::{BigInt, ToBigInt};

fn sum_of_digits_fac(x: i32) -> i32 {
    if x > 0 {
        let mut xb: BigInt = x.to_bigint().unwrap();
        let mut i = x;
        while i > 0 {
            xb *= i;
            i  -= 1;
        }
        xb.to_string()
          .chars()
          .map(|c| c as i32 - 48)
          .sum::<i32>()
    } else {
        1
    }
}

fn main() {
    println!("{}", sum_of_digits_fac(100));
}
