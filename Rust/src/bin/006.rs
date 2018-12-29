/// Problem 6 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=6

fn main() {
    let limit = 100;
    let sumsq = ((1 + limit) * limit / 2 as i32).pow(2);
    let sqsum = (1..(limit+1)).fold(0, |sum, a| sum + a * a);
    println!("{}", sumsq - sqsum);
}
