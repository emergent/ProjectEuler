/// Problem 7 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=7

extern crate project_euler;
use project_euler::is_prime;

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
