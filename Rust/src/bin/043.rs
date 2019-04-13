/// Problem 43 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=43
extern crate project_euler;
use project_euler::itertools::permutations;

fn all_divisible(pv: &Vec<char>, denomi: &Vec<u64>) -> bool {
    denomi.iter().enumerate()
        .all(|(i, d)| subnum(pv, i+1, 3) % d == 0)
}

fn subnum(xv: &Vec<char>, n: usize, digits_len: usize) -> u64 {
    xv[n..n+digits_len].iter()
        .collect::<String>()
        .parse::<u64>()
        .unwrap()
}

fn main() {
    let denomi = vec![2, 3, 5, 7, 11, 13, 17];
    let perm_in = "1234567890".chars().collect::<Vec<char>>();
    let perm = permutations(&perm_in, perm_in.len() as u32);

    let mut ansv: Vec<u64> = Vec::new();
    for p in perm {
        if all_divisible(&p, &denomi) {
            let num = p.iter().collect::<String>().parse::<u64>().unwrap();
            ansv.push(num);
        }
    }
    let ans = ansv.iter().sum::<u64>();
    println!("{}", ans);
}
