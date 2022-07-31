/// Problem 16 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=16
use num::bigint::BigInt;
use num::FromPrimitive;

fn sumofdigitspower(x: i32, p: usize) -> i32 {
    let xb: BigInt = FromPrimitive::from_i32(x).unwrap();
    num::pow(xb, p)
        .to_string()
        .chars()
        .map(|c| c as i32 - 48)
        .sum()
}

#[test]
fn test_sumof() {
    assert_eq!(sumofdigitspower(2, 2), 4);
    assert_eq!(sumofdigitspower(2, 10), 7);
}

fn main() {
    println!("{}", sumofdigitspower(2, 1000));
}
