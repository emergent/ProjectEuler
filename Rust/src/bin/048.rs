/// Problem 48 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=48
const N10: u64 = 10_000_000_000;

fn pow_last10d(n: u64, k: u64) -> u64 {
    let mut ret: u64 = 1;
    for _ in 0..k {
        ret = ret * n % N10;
    }
    ret
}

fn main() {
    let mut sum: u64 = 0;
    for i in 1 ..= 1000 {
        sum += pow_last10d(i, i);
        sum %= N10;
    }
    println!("{}", sum);
}
