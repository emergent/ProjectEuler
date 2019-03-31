/// Problem 39 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=39
use std::collections::HashMap;

fn pythagorean_triplet(c: i32) -> Option<Vec<(i32, i32, i32)>> {
    let mut v = Vec::new();

    for b in 4..c {
        for a in 3..b {
            if a.pow(2) + b.pow(2) == c.pow(2) {
                v.push((a, b, c))
            }
        }
    }

    match v.len() {
        0 => None,
        _ => Some(v)
    }
}

fn main() {
    let x = 5;
    let n = (x..1000)
        .filter_map(|c| pythagorean_triplet(c))
        .flatten()
        .filter_map(|(a,b,c)| {
            if a + b + c < 1000 { Some(a + b + c) } else { None }
        })
        .collect::<Vec<i32>>();

    let mut hmap = HashMap::new();
    for i in n {
        let count = hmap.entry(i).or_insert(0);
        *count += 1;
    }

    let mut max = 0;
    let mut maxkey = 0;
    for (key, value) in hmap {
        if value > max {
            max = value;
            maxkey = key;
        }
    }
    println!("{}, {}", maxkey, max);
}

#[test]
fn test_pt() {
    assert_eq!(pythagorean_triplet(5), Some(vec![(3,4,5)]));
    assert_eq!(pythagorean_triplet(52), Some(vec![(20,48,52)]));
    assert_eq!(pythagorean_triplet(51), Some(vec![(24,45,51)]));
    assert_eq!(pythagorean_triplet(50), Some(vec![(30,40,50), (14,48,50)]));
}