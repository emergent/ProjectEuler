/// Problem 3 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=3

fn maxprimefactor(x: i64) -> i64 {
    let limit = (x as f64).sqrt() as i64 + 1;
    let mut divider = 2;
    let mut target = x;

    while divider <= limit {
        if target % divider == 0 {
            target /= divider;
            if target == 1 {
                break;
            }
        } else {
            divider += 1;
        }
    }
    divider
}

fn main() {
    println!("{}", maxprimefactor(600851475143))
}
