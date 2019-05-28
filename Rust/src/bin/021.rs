/// Problem 21 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=21
use std::collections::HashSet;

fn get_divisors(x: i32) -> HashSet<i32> {
    let mut hs = HashSet::new();
    for i in 1.. {
        if x % i == 0 {
            hs.insert(i);
            hs.insert(x / i);
        }
        if i * i > x {
            break;
        }
    }
    hs
}

fn d(x: i32) -> i32 {
    get_divisors(x).iter().sum::<i32>() - x
}

fn get_amicable_pair(x: i32) -> Option<(i32, i32)> {
    match x {
        1 => None,
        _ => {
            let dx = d(x);
            if x < 10000 && x != dx && x == d(dx) {
                Some((x, dx))
            } else {
                None
            }
        }
    }
}

fn main() {
    let mut hs = HashSet::new();
    for i in 1..10000 {
        get_amicable_pair(i).map(|(x, y)| {
            hs.insert(x);
            hs.insert(y);
        });
    }
    println!("{}", hs.iter().sum::<i32>());
}
