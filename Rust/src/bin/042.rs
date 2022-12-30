/// Problem 42 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=42
use std::fs::File;
use std::io::Read;
use std::path::Path;

fn read_words() -> Vec<String> {
    let path = Path::new("data/p042_words.txt");

    let mut file = File::open(path).unwrap_or_else(|_| panic!("couldn't open {}", path.display()));

    let mut s = String::new();
    file.read_to_string(&mut s)
        .unwrap_or_else(|_| panic!("couldn't read {}", path.display()));

    let mut v = s
        .split(',')
        .map(|s| s.to_string().replace('\"', ""))
        .collect::<Vec<String>>();
    v.sort();
    v
}

fn alphabetical_score(s: &str) -> i32 {
    s.chars().map(|c| c as i32 - 64).sum()
}

fn triangle_numbers(nmax: i32) -> Vec<i32> {
    (1..=nmax).map(|i| i * (i + 1) / 2).collect()
}

fn main() {
    let tn = triangle_numbers(100);
    let words = read_words();

    let count = words
        .iter()
        .map(|w| alphabetical_score(w))
        .filter(|&x| tn.contains(&x))
        .count();

    println!("{}", count);
}
