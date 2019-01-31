/// Problem 14 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=14
fn chain(n: u32) -> u32 {
    match n {
        1 => 1,
        n if n % 2 == 0 => 1 + chain(n / 2),
        n => 1 + chain(3 * n + 1),
    }
}

fn main() {
    let mut maxn = 0;
    let mut maxi = 0;
    for i in 1 .. 1_000_000 {
        let ci = chain(i);
        if maxn < ci {
            maxn = ci;
            maxi = i;
        }
    }
    println!("{}", maxi);
}
