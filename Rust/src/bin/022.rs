/// Problem 22 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=22
use std::fs::File;
use std::io::Read;
use std::path::Path;

fn read_names() -> Vec<String> {
    let path = Path::new("data/p022_names.txt");

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

fn main() {
    let v = read_names();

    let total = v
        .iter()
        .enumerate()
        .map(|(i, s)| (i as i32 + 1) * s.chars().map(|c| c as i32 - 64).sum::<i32>())
        .sum::<i32>();
    println!("{}", total);
}
