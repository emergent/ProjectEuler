/// Problem 50 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=50
extern crate project_euler;
use project_euler::prime::primes;

fn main() {
    let lim = 1_000_000;
    let ps = primes(lim);
    let len = ps.len();

    let mut maxlen = 0;
    let mut sumps = 0;
    for (i, &p) in ps.iter().enumerate() {
        sumps += p;
        if sumps > lim {
            maxlen = i + 1;
            break;
        }
    }

    'outer: for i in (0..maxlen).rev() {
        for j in (0..len - i).rev() {
            let sum = ps[j..j + i].iter().sum::<u64>();
            if sum < lim && ps.contains(&sum) {
                println!("{}, {}, {}", i, j, sum);
                break 'outer;
            }
        }
    }
}
