/// Problem 29 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=29
extern crate num;

use num::bigint::BigInt;
use num::FromPrimitive;
use std::collections::HashSet;

fn powstr(a: i32, b: i32) -> String {
    let ab: BigInt = FromPrimitive::from_i32(a).unwrap();
    num::pow(ab, b as usize).to_string()
}

fn main() {
    let mut hs = HashSet::new();
    for a in 2..=100 {
        for b in 2..=100 {
            hs.insert(powstr(a, b));
        }
    }
    println!("{}", hs.len());
}
