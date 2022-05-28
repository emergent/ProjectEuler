/// Problem 57 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=57
use num::bigint::BigInt;
use num::FromPrimitive;

fn newton(n: &BigInt, d: &BigInt) -> (BigInt, BigInt) {
    let n_new = n + 2 * d;
    let d_new = n + d;
    (n_new, d_new)
}

fn count_digits(x: &BigInt) -> usize {
    x.to_string().len()
}

fn main() {
    let mut ansv = Vec::new();
    let mut numerator = FromPrimitive::from_i32(3).unwrap();
    let mut denominator = FromPrimitive::from_i32(2).unwrap();
    for i in 1..1000 {
        let (n, d) = newton(&numerator, &denominator);
        if count_digits(&n) > count_digits(&d) {
            ansv.push(i)
        }
        numerator = n;
        denominator = d;
    }
    println!("{}", ansv.len());
}
