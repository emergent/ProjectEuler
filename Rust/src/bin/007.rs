/// Problem 7 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=7

fn is_prime(x: i64) -> bool {
    let xmax = (x as f64).sqrt() as i64 + 1;
    match x {
        2 | 3 | 5 | 7 => true,
        _ if x < 2 => false,
        _ if x % 2 == 0 => false,
        _ => {
            for i in (3..xmax).step_by(2) {
                if x % i == 0 { return false; }
            }
            true
        }
    }
}

fn main() {
    let mut counter = 1; // includes '2'
    let mut var = 3;
    loop {
        if is_prime(var) {
            counter += 1;
            if counter == 10001 { break; }
        }
        var += 2;
    }
    println!("{}", var);
}
