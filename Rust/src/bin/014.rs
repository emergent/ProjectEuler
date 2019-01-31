/// Problem 14 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=14
use std::collections::HashMap;

fn chain(n: u32, cache: &mut HashMap<u32, u32>) -> u32 {
    match cache.get(&n) {
        Some(&i) => i,
        None => {
            let collaz = match n {
                1 => 1,
                n if n % 2 == 0 => 1 + chain(n / 2, cache),
                n => 1 + chain(3 * n + 1, cache),
            };
            cache.insert(n, collaz);
            collaz
        },
    }
}

fn main() {
    let mut cache = HashMap::<u32,u32>::new();

    let mut maxn = 0;
    let mut maxi = 0;
    for i in 1 .. 1_000_000 {
        let ci = chain(i, &mut cache);
        if maxn < ci {
            maxn = ci;
            maxi = i;
        }
    }
    println!("{}", maxi);
}
