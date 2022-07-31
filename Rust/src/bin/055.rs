/// Problem 55 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=55
fn reverse_num(x: u128) -> u128 {
    x.to_string()
        .chars()
        .rev()
        .collect::<String>()
        .parse::<u128>()
        .unwrap()
}

fn is_lychrel(x: u128) -> bool {
    let mut xl = x;
    let mut xrev = reverse_num(xl);

    for _ in 0..50 {
        xl += xrev;
        xrev = reverse_num(xl);
        if xrev == xl {
            return false;
        }
    }
    true
}

fn main() {
    let ans = (1..10000).filter(|&x| is_lychrel(x)).count();
    println!("{}", ans);
}
