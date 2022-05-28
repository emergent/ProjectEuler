/// Problem 41 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=41
use project_euler::{itertools::permutations, prime::is_prime};

fn numcat(v: &Vec<u32>) -> u32 {
    if v.is_empty() {
        return 0;
    }

    let mut catn: u32 = 0;
    for (i, &n) in v.iter().rev().enumerate() {
        catn += n * 10_u32.pow(i as u32);
    }
    catn
}

fn pandigitals(d: u32) -> Vec<u32> {
    if d < 1 {
        return vec![];
    }

    let ins = (1..=d).collect::<Vec<_>>();
    let res = permutations(&ins, d);
    res.into_iter().map(|r| numcat(&r)).collect::<Vec<u32>>()
}

fn main() {
    let mut ps = pandigitals(7);
    ps.reverse();
    for p in ps {
        if is_prime(p as u64) {
            println!("{}", p);
            return;
        }
    }
}

#[test]
fn test_numcat() {
    assert_eq!(numcat(&vec![]), 0);
    assert_eq!(numcat(&vec![1]), 1);
    assert_eq!(numcat(&vec![1, 2, 3]), 123);
    assert_eq!(numcat(&vec![1, 2, 3, 4]), 1234);
}
