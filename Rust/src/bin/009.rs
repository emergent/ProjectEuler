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
    let mut abc = 0;
    for c in (5..1000).step_by(2) {
        match pythagorean_triplet(c) {
            Some((a, b, c)) => {
                let sumabc = a + b + c;
                if 1000 % sumabc == 0 {
                    let quot = 1000 / sumabc;
                    abc = a * b * c * quot.pow(3);
                    println!("({}, {}, {})", a * quot, b * quot, c * quot);
                    break;
                }
            }
            None => continue,
        }
    }
    println!("{}", abc);
}
