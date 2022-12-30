/// Problem 32 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=32
use std::collections::HashSet;

fn is_pandigital(a: i32, b: i32, c: i32) -> bool {
    let mut f = [false; 10];

    for mut x in [a, b, c] {
        while x > 0 {
            let digit = (x % 10) as usize;
            if digit == 0 || f[digit] {
                return false;
            }

            f[digit] = true;
            x /= 10;
        }
    }

    f[1..].iter().all(|x| *x)
}

fn main() {
    let mut hs = HashSet::new();

    for i in 1..100 {
        let (mut j, limit) = if i < 10 { (1000, 10000) } else { (100, 1000) };
        while j < limit {
            if is_pandigital(i, j, i * j) {
                hs.insert(i * j);
            }
            j += 1;
        }
    }

    let ans = hs.into_iter().sum::<i32>();
    println!("{}", ans);
}
