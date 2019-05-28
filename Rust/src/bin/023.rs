/// Problem 23 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=23
use std::collections::HashSet;

fn get_divisors(x: i32) -> HashSet<i32> {
    let mut hs = HashSet::new();
    for i in 1.. {
        if x % i == 0 {
            hs.insert(i);
            hs.insert(x / i);
        }
        if i * i > x {
            break;
        }
    }
    hs
}

fn is_abundant(x: &i32) -> bool {
    *x < get_divisors(*x).iter().sum::<i32>() - *x
}

fn main() {
    let limit = 28123 + 1;
    let mut abundants: Vec<i32> = (1..limit).filter(is_abundant).collect::<Vec<i32>>();
    abundants.sort();

    let mut sumoftwo = HashSet::<i32>::new();
    for (i, x) in abundants.iter().enumerate() {
        for y in abundants[i..].iter() {
            let sum = *x + *y;
            if sum < limit {
                sumoftwo.insert(sum);
            }
        }
    }
    let allsum: i32 = (1..limit).sum();
    println!("{}", allsum - sumoftwo.iter().sum::<i32>());
}
