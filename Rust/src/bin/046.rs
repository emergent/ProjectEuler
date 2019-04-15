/// Problem 46 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=046
extern crate project_euler;
use project_euler::prime::is_prime;

fn goldbach(x: u32) -> bool {
    for i in 1.. {
        let twice_sq = i * i * 2;
        if x > twice_sq + 2 {
            if is_prime((x - twice_sq).into()) {
                return true;
            } else {
                continue;
            }
        } else {
            break;
        }
    }
    false
}

fn main() {
    for i in (9..).step_by(2) {
        if is_prime(i.into()) {
            continue;
        } else {
            if !goldbach(i) {
                println!("{}", i);
                break;
            }
        }
    }
}
