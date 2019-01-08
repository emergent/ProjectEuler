/// Problem 30 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=30

fn nthpower(x: i32, e: u32) -> bool {
    let mut quot = x;
    let mut sumpower = 0;

    while quot != 0 {
        sumpower += (quot % 10).pow(e);
        quot = quot / 10;
    }
    
    if sumpower == x { true } else { false }
}

fn main() {
    let ans: i32 = (11..1000000).filter(|&x| nthpower(x, 5)).sum();
    println!("{}", ans);
}
