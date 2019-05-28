/// Problem 4 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=4

fn is_palindromic(x: i32) -> bool {
    let rev = x.to_string().chars().rev().collect::<String>();
    x.to_string() == rev
}

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
