/// Problem 9 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=9

fn pythagorean_triplet(c: i32) -> Option<(i32, i32, i32)> {
    for b in 4..c {
        for a in 3..b {
            if a.pow(2) + b.pow(2) == c.pow(2) {
                return Some((a, b, c));
            }
        }
    }
    None
}

#[test]
fn test_pythagorean_triplet() {
    assert_eq!(pythagorean_triplet(17), Some((8, 15, 17)));
    assert_eq!(pythagorean_triplet(5), Some((3, 4, 5)));
    assert_eq!(pythagorean_triplet(6), None);
}

fn main() {
    let abc = (5..).step_by(2)
        .flat_map(|c| pythagorean_triplet(c))
        .filter(|&(a, b, c)| 1000 % (a + b + c) == 0)
        .map(|(a, b, c)| {
            let quot = 1000 / (a + b + c);
            println!("({}, {}, {})", a * quot, b * quot, c * quot);
            a * b * c * quot.pow(3)
        })
        .next()
        .unwrap_or(0);
    println!("{}", abc);
}
