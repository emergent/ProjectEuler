/// Problem 14 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=14
const N: u64 = 1_000_000;

fn chain(n: u64, cache: &mut [u64]) -> u64 {
    if n < N && cache[n as usize] > 0 {
        return cache[n as usize];
    }

    let collaz = match n {
        1 => 1,
        n if n % 2 == 0 => 1 + chain(n / 2, cache),
        n => 1 + chain(3 * n + 1, cache),
    };
    if n < N {
        cache[n as usize] = collaz;
    }
    collaz
}

fn main() {
    let mut cache = [0; N as usize];

    let mut maxn = 0;
    let mut maxi = 0;
    for i in 1..1_000_000 {
        let ci = chain(i, &mut cache);
        if maxn < ci {
            maxn = ci;
            maxi = i;
        }
    }
    println!("{}, {}", maxn, maxi);
}
