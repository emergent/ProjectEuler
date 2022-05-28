/// Problem 32 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=32
use permutohedron::LexicalPermutation;
use std::collections::HashSet;

fn chars2int(cs: &[char]) -> i32 {
    cs.iter().collect::<String>().parse::<i32>().unwrap()
}

fn pandigital_product(cs: &Vec<char>) -> Option<i32> {
    let product = chars2int(&cs[5..]);

    for i in 1..4 {
        let m1 = chars2int(&cs[..i]);
        let m2 = chars2int(&cs[i..5]);

        if m1 * m2 == product {
            println!("{}, {}, {}", m1, m2, product);
            return Some(product);
        }
    }
    None
}

fn main() {
    let mut nums = "123456789".chars().collect::<Vec<char>>();
    let mut hs = HashSet::new();

    loop {
        if let Some(x) = pandigital_product(&nums) {
            hs.insert(x);
        }

        if !nums.next_permutation() {
            break;
        }
    }

    let ans = hs.into_iter().sum::<i32>();
    println!("{}", ans);
}
