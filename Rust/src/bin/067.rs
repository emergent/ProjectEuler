/// Problem 67 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=67
use std::fs::File;
use std::io::Read;
use std::path::Path;

fn read_triangle() -> Vec<Vec<u32>> {
    let path = Path::new("data/p067_triangle.txt");

    let mut file = File::open(&path).unwrap_or_else(|_| panic!("couldn't open {}", path.display()));

    let mut s = String::new();
    file.read_to_string(&mut s)
        .unwrap_or_else(|_| panic!("couldn't read {}", path.display()));

    s.trim()
        .split('\n')
        .map(|line| {
            line.split_whitespace()
                .map(|s| s.parse::<u32>().unwrap_or(0))
                .collect::<Vec<u32>>()
        })
        .collect()
}

fn dp(pred: &mut Vec<u32>, curr: &[u32]) -> Vec<u32> {
    let mut v = Vec::new();
    pred.push(0);
    pred.insert(0, 0);

    for (i, &d) in curr.iter().enumerate() {
        v.push(std::cmp::max(pred[i], pred[i + 1]) + d);
    }
    v
}

fn main() {
    let triangle = read_triangle();
    let mut p = triangle[0].clone();

    for v in &triangle[1..] {
        p = dp(&mut p, v);
    }

    println!("{}", p.iter().max().unwrap());
}
