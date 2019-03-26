/// Problem 32 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=32
extern crate project_euler;
use project_euler::itertools::permutations;
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
    let nums = "123456789".chars().collect::<Vec<char>>();
    let perm = permutations(&nums, nums.len() as u32);
    let ans = perm.iter()
        .filter_map(|p| pandigital_product(p))
        .collect::<HashSet<i32>>()
        .iter()
        .sum::<i32>();
    println!("{}", ans);
}
