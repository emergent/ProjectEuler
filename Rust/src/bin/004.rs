/// Problem 4 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=4
fn is_palindromic(x: i32) -> bool {
    let rev = x.to_string().chars().rev().collect::<String>();
    x.to_string() == rev
}

/*
use std::collections::VecDeque;
fn is_palindromic(mut x: i32) -> bool {
    let mut v1 = VecDeque::new();
    let mut v2 = VecDeque::new();
    while x > 0 {
        v1.push_back(x % 10);
        v2.push_front(x % 10);
        x /= 10;
    }
    v1 == v2
}
 */

fn main() {
    let pmax = (100..1000)
        .map(|i| {
            (i..1000)
                .map(|j| i * j)
                .filter(|&k| is_palindromic(k))
                .max()
                .unwrap_or(0)
        })
        .max()
        .unwrap_or(0);
    println!("{}", pmax);
}
