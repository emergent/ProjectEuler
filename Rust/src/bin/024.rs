/// Problem 24 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=24
extern crate project_euler;
use project_euler::itertools::permutations;

fn main() {
    let lexperm = permutations(&vec!['0','1','2','3','4','5','6','7','8','9'], 10);
    let ans = lexperm[1000000-1].iter().collect::<String>().parse::<u32>().unwrap();
    println!("{}", ans);
}
