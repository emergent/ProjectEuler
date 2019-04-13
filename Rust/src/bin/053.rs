/// Problem 53 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=53
extern crate num;
use num::bigint::BigInt;
use num::FromPrimitive;

fn combo_gt(n: u32, r: u32, x: u32) -> bool {
    let mut xb: BigInt = FromPrimitive::from_u32(1).unwrap();
    for i in (n-r+1) ..= n  {
        xb *= i;
    }
    for j in 1 ..= r {
        xb /= j;
    }
    xb > FromPrimitive::from_u32(x).unwrap()
}

fn main() {
    let mut count = 0;
    for n in 1 ..= 100 {
        for r in 1 ..= n {
            if combo_gt(n, r, 1_000_000) {
                count += 1;
            }
        }
    }
    println!("{}", count);
}
