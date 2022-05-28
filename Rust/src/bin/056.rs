/// Problem 56 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=56
use num::bigint::BigInt;
use num::FromPrimitive;

fn sum_of_digits(a: u32, b: u32) -> u32 {
    let xb: BigInt = FromPrimitive::from_u32(a).unwrap();
    num::pow(xb, b as usize)
        .to_string()
        .chars()
        .map(|c| c as u32 - 48)
        .sum::<u32>()
}

fn main() {
    let ans = (1..100)
        .flat_map(|a| (1..100).map(|b| sum_of_digits(a, b)).max())
        .max()
        .unwrap_or(0);
    println!("{}", ans);
}
